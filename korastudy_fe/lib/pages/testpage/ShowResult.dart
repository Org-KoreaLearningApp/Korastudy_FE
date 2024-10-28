import 'package:flutter/material.dart';

class ShowResultScreen extends StatefulWidget {
  const ShowResultScreen({Key? key}) : super(key: key);

  @override
  _ShowResultScreenState createState() => _ShowResultScreenState();
}

class _ShowResultScreenState extends State<ShowResultScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            SizedBox(height: 12),
            _buildTabView(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildResultList(context, showCorrect: null),
                  _buildResultList(context, showCorrect: false),
                  _buildResultList(context, showCorrect: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 54,
      backgroundColor: Color(0XFF1EA5FC),
      automaticallyImplyLeading: false,
      leadingWidth: 44,
      leading: Padding(
        padding: EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      centerTitle: true,
      title: Text(
        "Hiển thị đáp án",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildTabView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0XFFD5D5D5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.zero,
          labelColor: Color(0XFF212121),
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          tabs: [
            _buildTab("Tất cả", 0),
            _buildTab("Chọn sai", 1),
            _buildTab("Chọn đúng", 2),
          ],
          indicatorColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      height: 26,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: _tabIndex == index ? Colors.white : Color(0XFFD5D5D5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildResultList(BuildContext context, {bool? showCorrect}) {
    final List<Map<String, dynamic>> results = [
      {'question': 'Câu hỏi 1', 'correct': true, 'answer': 'A', 'score': 10},
      {'question': 'Câu hỏi 2', 'correct': false, 'answer': 'B', 'score': 0},
      {'question': 'Câu hỏi 3', 'correct': true, 'answer': 'C', 'score': 10},
      {'question': 'Câu hỏi 4', 'correct': false, 'answer': 'D', 'score': 0},
    ];

    final filteredResults = showCorrect == null
        ? results
        : results.where((result) => result['correct'] == showCorrect).toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final result = filteredResults[index];
        return _buildResultItem(
          context,
          result['question'],
          result['correct'],
          result['answer'],
          result['score'],
        );
      },
    );
  }

  Widget _buildResultItem(BuildContext context, String question, bool correct, String answer, int score) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            correct ? Icons.check_circle : Icons.cancel,
            color: correct ? Colors.green : Colors.red,
            size: 24,
          ),
        ),
        title: Text(question),
        subtitle: Text('Đáp án đúng: $answer'),
        trailing: Text('Điểm: $score'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShowResultScreen(),
  ));
}