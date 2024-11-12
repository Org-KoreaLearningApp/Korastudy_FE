import 'package:flutter/material.dart';
import 'package:korastudy_fe/components/selectGrammarCard_component.dart';
import 'package:korastudy_fe/models/grammar_model.dart';
import 'package:korastudy_fe/pages/grammar/grammar_detail.dart';
import 'package:korastudy_fe/services/firestore_service.dart';

class GrammarList extends StatefulWidget {
  @override
  _GrammarListState createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<GrammarSet>> _grammarSets;

  @override
  void initState() {
    super.initState();
    _grammarSets = _firestoreService.getGrammarSets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: FutureBuilder<List<GrammarSet>>(
        future: _grammarSets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu'));
          } else {
            List<GrammarSet> grammarSets = snapshot.data!;
            return Column(
              children: [
                for (int i = 0; i < grammarSets.length; i += 3)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: _getMainAxisAlignment(i, grammarSets),
                      children: _buildCards(i, grammarSets),
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }

  MainAxisAlignment _getMainAxisAlignment(
      int startIndex, List<GrammarSet> grammarSets) {
    int count = 0;
    for (int j = startIndex;
        j < startIndex + 3 && j < grammarSets.length;
        j++) {
      count++;
    }
    return count == 2
        ? MainAxisAlignment.start
        : MainAxisAlignment.spaceBetween;
  }

  List<Widget> _buildCards(int startIndex, List<GrammarSet> grammarSets) {
    List<Widget> cards = [];
    List<double> heights = [];

    for (int j = startIndex;
        j < startIndex + 3 && j < grammarSets.length;
        j++) {
      final title = grammarSets[j].name;
      final textPainter = TextPainter(
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
        maxLines: 5,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 115);
      heights.add(textPainter.height + 100);
    }

    double maxHeight =
        (heights.isNotEmpty ? heights.reduce((a, b) => a > b ? a : b) : 150) +
            12;

    for (int j = startIndex;
        j < startIndex + 3 && j < grammarSets.length;
        j++) {
      cards.add(
        Container(
          height: maxHeight,
          child: SelectGrammar(
            title: grammarSets[j].name,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GrammarDetail(
                    title: grammarSets[j].name,
                    setId: grammarSets[j].id,
                  ),
                ),
              );
            },
          ),
        ),
      );

      if (j < startIndex + 2 && j < grammarSets.length - 1) {
        cards.add(SizedBox(width: 43));
      }
    }

    return cards;
  }
}
