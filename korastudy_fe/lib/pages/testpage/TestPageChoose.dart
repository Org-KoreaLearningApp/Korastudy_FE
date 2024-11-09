import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';
import 'TestPageFinal.dart'; // Import trang cuối

class TestPageChooseWidget extends StatefulWidget {
  @override
  _TestPageChooseWidgetState createState() => _TestPageChooseWidgetState();
}

class _TestPageChooseWidgetState extends State<TestPageChooseWidget> {
  List<Question> _questions = [];
  List<String?> _selectedAnswers = [];
  int _currentPage = 0;
  PageController _pageController = PageController();
  AudioPlayer _audioPlayer = AudioPlayer();
  String _audioUrl = '';
  Duration _audioDuration = Duration.zero;
  Duration _audioPosition = Duration.zero;
  Timer? _timer;
  Duration _remainingTime = Duration(minutes: 90);

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _audioDuration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _audioPosition = position;
      });
    });
    _startTimer();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - Duration(seconds: 1);
        } else {
          _timer?.cancel();
          _showSubmitDialog();
        }
      });
    });
  }

  Future<void> _loadQuestions() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('testpage')
          .doc('test1')
          .collection('questions')
          .orderBy(FieldPath.documentId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          _questions = snapshot.docs.map((doc) {
            return Question.fromJson(doc.data() as Map<String, dynamic>);
          }).toList();
          _selectedAnswers = List<String?>.filled(_questions.length, null);

          // Lấy URL của audio từ câu hỏi đầu tiên
          if (_questions.isNotEmpty && _questions[0].audioUrl.isNotEmpty) {
            _audioUrl = _questions[0].audioUrl;
            _playAudio();
          }
        });

        // Thêm thông báo debug
        print('Questions loaded: ${_questions.length}');
      } else {
        print('No questions found');
      }
    } catch (e) {
      print('Error loading questions: $e');
    }
  }

  Future<void> _playAudio() async {
    if (_audioUrl.isNotEmpty) {
      await _audioPlayer.play(UrlSource(_audioUrl));
      print('Audio started playing');
    }
  }

  void _onAnswerSelected(String answer) {
    setState(() {
      _selectedAnswers[_currentPage] = answer;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (_currentPage < _questions.length - 1) {
        setState(() {
          _currentPage++;
        });
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else if (_allQuestionsAnswered()) {
        _showSubmitDialog();
      }
    });
  }

  bool _allQuestionsAnswered() {
    return !_selectedAnswers.contains(null);
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bạn có muốn nộp bài?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestPageFinalWidget()),
              );
              _audioPlayer.stop(); // Dừng audio khi nộp bài
            },
            child: Text('Đồng ý'),
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    bool shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Bạn có muốn thoát?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Hủy'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Đồng ý'),
              ),
            ],
          ),
        ) ??
        false;

    if (shouldPop) {
      _audioPlayer.stop(); // Dừng audio khi thoát
    }

    return shouldPop;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Color.fromRGBO(30, 165, 252, 1),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Câu ${_currentPage + 1}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.black, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '${_remainingTime.inMinutes}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            centerTitle: false,
          ),
        ),
        body: _questions.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    _buildAudioPlayer(),
                    _buildProgressBar(),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        physics: BouncingScrollPhysics(),
                        itemCount: _questions.length,
                        itemBuilder: (context, index) {
                          return _buildQuestionBox(_questions[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: double.infinity,
      height: 7,
      color: Color.fromRGBO(158, 205, 221, 1),
      child: FractionallySizedBox(
        widthFactor: (_currentPage + 1) / _questions.length,
        child: Container(
          color: Color.fromRGBO(63, 204, 251, 1),
        ),
      ),
    );
  }

  Widget _buildQuestionBox(Question question) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 344,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildQuestionHeader(question.questionText),
          _buildAnswerOptions(question),
        ],
      ),
    );
  }

  Widget _buildQuestionHeader(String questionText) {
    return Container(
      width: 344,
      height: 89,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: Color.fromRGBO(135, 185, 231, 1),
      ),
      padding: EdgeInsets.all(14),
      child: Text(
        questionText,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildAudioPlayer() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.play_arrow, color: Colors.white),
            onPressed: () async {
              await _audioPlayer.play(UrlSource(_audioUrl));
              print('Audio started playing');
            },
          ),
          Text(
            '${_audioPosition.inMinutes}:${(_audioPosition.inSeconds % 60).toString().padLeft(2, '0')} / ${_audioDuration.inMinutes}:${(_audioDuration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerOptions(Question question) {
    return Column(
      children: question.choices.entries.map((entry) {
        return _buildAnswerOption(entry.key, entry.value);
      }).toList(),
    );
  }

  Widget _buildAnswerOption(String label, String text) {
    return GestureDetector(
      onTap: () => _onAnswerSelected(label),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedAnswers[_currentPage] == label ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedAnswers[_currentPage] == label ? Colors.yellow : Colors.white,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionType;
  final String questionText;
  final String audioUrl;
  final Map<String, String> choices;
  final String correctAnswer;
  final int score;

  Question({
    required this.questionType,
    required this.questionText,
    required this.audioUrl,
    required this.choices,
    required this.correctAnswer,
    required this.score,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionType: json['questionType'],
      questionText: json['questionText'],
      audioUrl: json['audioUrl'],
      choices: Map<String, String>.from(json['choices']),
      correctAnswer: json['correctAnswer'],
      score: json['score'],
    );
  }
}