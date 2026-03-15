import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/utils/popup_container.dart';
import 'package:flutter_application_1/utils/todo_container.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final mybox = Hive.box('mybox');
TodoList db = TodoList();
// List todoList = [
//   ["Drive to church", true],
//   ["Eat some snacks", true],
//   ["Drink some water", false],
// ];

final controller = TextEditingController();

class _HomeState extends State<Home> {
  void onChanged(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void addItem() {
    setState(() {
      db.todoList.add([controller.text, false]);
    });
    controller.clear();
    Navigator.pop(context);
    db.updateData();
  }

  void canCel() {
    Navigator.pop(context);
  }

  void deleteItem(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  void floatIconFunction() {
    showDialog(
      context: context,
      builder: (context) =>
          //creating the alert somewhere
          PopupContainer(
            controller: controller,
            addItem: (context) => addItem(),
            canCel: (context) => canCel(),
            onSave: "save",
            onCancel: "cancel",
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Center(
          child: Text(
            "welcome to your to do List",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: floatIconFunction,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => TodoContainer(
          onChanged: (context) => onChanged(index),
          itemname: db.todoList[index][0],
          checked: db.todoList[index][1],
          deleteData: (context) => deleteItem(index),
        ),
      ),
    );
  }
}
