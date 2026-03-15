import 'package:hive_flutter/hive_flutter.dart';

class TodoList {
  List todoList = [];

  final mybox = Hive.box("mybox");

  //available data if it is the first time on the application
  void initialData() {
    todoList = [
      ["Drive to church", true],
      ["Eat some snacks", true],
      ["Drink some water", false],
    ];
  }

  void loadData() {
    todoList = mybox.get("TODOLIST");
  }

  void updateData() {
    mybox.put("TODOLIST", todoList);
  }
}
