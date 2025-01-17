// lib/pages/vocabulary/vocabulary_list_mean.dart
import 'package:flutter/material.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';
import 'package:korastudy_fe/services/firestore_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:korastudy_fe/widgets/note_dialog.dart';
import 'package:korastudy_fe/pages/vocabulary/flashcard.dart';

class VocabularyListMeanWidget extends StatefulWidget {
  final String setId;

  VocabularyListMeanWidget({required this.setId});

  @override
  _VocabularyListMeanWidgetState createState() =>
      _VocabularyListMeanWidgetState();
}

class _VocabularyListMeanWidgetState extends State<VocabularyListMeanWidget> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<Vocabulary>> _vocabularyList;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _vocabularyList = _firestoreService.getVocabularies(widget.setId);
  }

  void _playAudio(String url) async {
    try {
      print('Playing audio from URL: $url');
      await _audioPlayer.play(UrlSource(url));
      print('Audio playback started successfully');
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(70, 160, 229, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Danh sách từ vựng',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.quiz, size: 30, color: Colors.white),
            onPressed: () async {
              List<Vocabulary> vocabularies = await _vocabularyList;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FlashcardPage(vocabularies: vocabularies),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Vocabulary>>(
        future: _vocabularyList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu'));
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: snapshot.data!.map((vocabulary) {
                  return Column(
                    children: [
                      buildVocabularyCard(
                          vocabulary, screenWidth, screenHeight, context),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildVocabularyCard(Vocabulary vocabulary, double screenWidth,
      double screenHeight, BuildContext context) {
    return Container(
      width: screenWidth * 0.95,
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth * 0.17,
              height: screenHeight * 0.16,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.02,
                    child: Container(
                      width: screenWidth * 0.13,
                      height: screenWidth * 0.13,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(94, 186, 217, 1),
                        borderRadius: BorderRadius.all(Radius.elliptical(
                            screenWidth * 0.13, screenWidth * 0.13)),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.volume_up,
                            color: Colors.white), // Speaker icon
                        onPressed: () {
                          print('Audio URL: ${vocabulary.audioUrl}');
                          _playAudio(vocabulary.audioUrl);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.78,
            child: Container(
              width: screenWidth * 0.17,
              height: screenHeight * 0.16,
              child: Icon(Icons.favorite_border,
                  color: Colors.black, size: screenWidth * 0.08), // Team icon
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.17,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 0, vertical: screenHeight * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          vocabulary.word,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.05,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.005),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          vocabulary.meaning,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.04,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.05,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: screenHeight * 0.005,
                          left: screenWidth * 0.01,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return NoteDialog();
                                },
                              );
                            },
                            child: Text(
                              'Thêm ghi chú',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: screenWidth * 0.04,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
