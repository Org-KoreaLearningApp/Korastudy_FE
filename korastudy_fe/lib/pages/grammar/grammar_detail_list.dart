import 'package:flutter/material.dart';
import 'package:korastudy_fe/models/grammar_model.dart';
import 'package:korastudy_fe/services/firestore_service.dart';
import 'package:korastudy_fe/components/Grammar_content_component.dart';
import 'package:korastudy_fe/components/grammarCard_component.dart';

class GrammarDetailList extends StatelessWidget {
  final String setId;
  final FirestoreService _firestoreService = FirestoreService();

  GrammarDetailList({required this.setId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Grammar>>(
      future: _firestoreService.getGrammars(setId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Không có dữ liệu'));
        } else {
          List<Grammar> grammars = snapshot.data!;
          return Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: grammars.length,
              itemBuilder: (context, index) {
                final item = grammars[index];
                return Column(
                  children: [
                    if (index == 0) SizedBox(height: 20),
                    GrammarCard(
                      title: item.name,
                      subtitle: item.mean,
                      onLike: () {
                        print('Thích: ${item.name}');
                      },
                      onCheck: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: SingleChildScrollView(
                                child: GrammarContent(
                                  title: item.name,
                                  subtitle: item.mean,
                                  content: item.describe,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
