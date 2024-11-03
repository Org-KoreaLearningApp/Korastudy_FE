import 'package:flutter/material.dart';
import 'package:korastudy_fe/models/vocabulary_model.dart';
import 'package:korastudy_fe/services/firestore_service.dart';
import 'package:korastudy_fe/pages/vocabulary/vocabulary_list_mean.dart';

class VocabularyListWidget extends StatefulWidget {
  @override
  _VocabularyListWidgetState createState() => _VocabularyListWidgetState();
}

class _VocabularyListWidgetState extends State<VocabularyListWidget> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<VocabularySet>> _vocabularySets;

  @override
  void initState() {
    super.initState();
    _vocabularySets = _firestoreService.getVocabularySets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bộ Từ Vựng',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Inter',
            fontSize: 20,
            letterSpacing: -0.3,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 165, 252, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<VocabularySet>>(
        future: _vocabularySets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final vocabularySet = snapshot.data![index];
                return ListTile(
                  title: Text(vocabularySet.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VocabularyListMeanWidget(setId: vocabularySet.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}