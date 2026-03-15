import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/popup_container.dart';
import 'package:flutter_application_1/utils/todo_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List todoList = [
  ["Drive to church", true],
  ["Eat some snacks", true],
  ["Drink some water", false],
];

final controller = TextEditingController();

class _HomeState extends State<Home> {
  void onChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void addItem() {
    setState(() {
      todoList.add([controller.text, false]);
    });
    controller.clear();
    Navigator.pop(context);
  }

  void canCel() {
    Navigator.pop(context);
  }

  void deleteItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
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
        itemCount: todoList.length,
        itemBuilder: (context, index) => TodoContainer(
          onChanged: (context) => onChanged(index),
          itemname: todoList[index][0],
          checked: todoList[index][1],
          deleteData:(context)=> deleteItem(index),
        ),
      ),
    );
  }
}
