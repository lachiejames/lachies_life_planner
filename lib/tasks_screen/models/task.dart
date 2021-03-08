class Task {
  final String name;
  final String dateCreated;
  final bool isComplete;

  Task({this.name, this.dateCreated, this.isComplete});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dateCreated = json['dateCreated'],
        isComplete = json['isComplete'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'dateCreated': dateCreated.toString(),
      'isComplete': isComplete,
    };
  }
}
