class ToDo {
  String? title;
  String? description;
  int? category;
  int? taskPriority;
  bool? completed;
  String? dateTime;
  String? sortDateTime;
  ToDo({
    required this.title,
    required this.description,
    required this.category,
    required this.taskPriority,
    required this.completed,
    required this.dateTime,
    required this.sortDateTime,
  });

  ToDo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        category = json['category'],
        taskPriority = json['taskPriority'],
        completed = json['completed'],
        dateTime = json['dateTime'],
        sortDateTime = json['sortDateTime'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'category': category,
        'taskPriority': taskPriority,
        'completed': completed,
        'dateTime': dateTime,
        'sortDateTime' : sortDateTime,
      };
}
