// ignore: camel_case_types
class todos{
  int userId;
  int id;
  String title;
  bool completed;
  todos(this.userId, this.id, this.title, this.completed);

  todos.fromMap(Map<String, dynamic> map)
      : this(
    map['userId'],
    map['id'],
    map['title'],
    map['completed'],
  );
}