class Grammar {
  final String id;
  final String describe;
  final String example;
  final String mean;
  final String name;
  final String use;

  Grammar({
    required this.id,
    required this.describe,
    required this.example,
    required this.mean,
    required this.name,
    required this.use,
  });

  factory Grammar.fromMap(Map<String, dynamic> data, String documentId) {
    return Grammar(
      id: documentId,
      describe: data['describe'] ?? '',
      example: data['example'] ?? '',
      mean: data['mean'] ?? '',
      name: data['name'] ?? '',
      use: data['use'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'describe': describe,
      'example': example,
      'mean': mean,
      'name': name,
      'use': use,
    };
  }
}

class GrammarSet {
  final String id;
  final String name;
  final String topikLevel;

  GrammarSet({
    required this.id,
    required this.name,
    required this.topikLevel,
  });

  factory GrammarSet.fromMap(Map<String, dynamic> data, String documentId) {
    return GrammarSet(
      id: documentId,
      name: data['name'] ?? '',
      topikLevel: data['topikLevel'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'topikLevel': topikLevel,
    };
  }
}
