class Task {
  int? id;
  String title;
  String description;
  bool completed;

  Task({
    this.id,
    required this.title,
    this.description = '',
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      completed: map['completed'] == 1,
    );
  }

  // タスクの完了状態を切り替えるメソッド
  void toggleCompleted() {
    completed = !completed;
  }
}