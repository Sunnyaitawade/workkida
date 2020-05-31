import 'dart:convert';

class Category {
  int id;
  String name;
  bool finished;
  int todoId;
  //Constructor
  Category({
    this.id,
    this.name,
    this.finished,
    this.todoId
  });
  //Do the same as Todo
  factory Category.fromJson(Map<String, dynamic> json) {
    Category newTask = Category(
        id: json['id'],
        name: json['name'],
        finished: json['isfinished'],
        todoId: json['todoid']
    );
    return newTask;
  }
  //clone a Task, or "copy constructor"
  factory Category.fromTask(Category anotherTask) {
    return Category(
        id: anotherTask.id,
        name: anotherTask.name,
        finished: anotherTask.finished,
        todoId: anotherTask.todoId
    );
  }
}