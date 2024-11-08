import 'package:flutter/material.dart';
import 'package:korean_dictionary/korean_dictionary.dart';

class DictionaryVerbWidget extends StatefulWidget {
  @override
  _DictionaryVerbWidgetState createState() => _DictionaryVerbWidgetState();
}

class _DictionaryVerbWidgetState extends State<DictionaryVerbWidget> {
  final String apiKey = 'AC3717EB24D0BD2B4729C85AE3EF50DA';
  late final KoreanLearnersDictionary dict;
  List<Map<String, String>> searchResults = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    dict = Dictionary.koreanLearners(apiKey: apiKey);
  }

  Future<void> searchWord(String word) async {
    try {
      final result = await dict.search(
        word,
        transLang: {TranslationLanguage.vietnamese},
      );
      List<Map<String, String>> results = [];
      for (final item in result) {
        final translation = item.senses.first.translations.values.first;
        final detailedInfo = await dict.view(
          item.targetCode,
          transLang: {TranslationLanguage.english},
        );
        final anExample = detailedInfo.senses.first.examples.first.example;
        results.add({
          'word': translation.translations?.first ?? '',
          'definition': translation.definition ?? '',
          'example': anExample,
        });
      }
      setState(() {
        searchResults = results;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary Verb Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a word',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchWord(_controller.text);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  return ListTile(
                    title: Text(result['word']!),
                    subtitle: Text(
                      'Definition: ${result['definition']}\nExample: ${result['example']}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DictionaryVerbWidget(),
  ));
}