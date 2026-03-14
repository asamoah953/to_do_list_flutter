import 'package:flutter/material.dart';

class PopupContainer extends StatelessWidget {
  final TextEditingController controller;
  final String onSave;
  final String onCancel;
  final Function(BuildContext)? addItem;
  const PopupContainer({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        color: Colors.amber,
        height: 200,
        width: 300,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "input to do item",
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => addItem,
                  child: Text(onSave),
                  style: ButtonStyle(),
                ),
                ElevatedButton(
                  onPressed: () => addItem,
                  child: Text(onCancel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
