import 'package:flutter/material.dart';

class PopupContainer extends StatelessWidget {
  final TextEditingController controller;
  final String onSave;
  final String onCancel;
  final Function(BuildContext)? addItem;
  final Function(BuildContext)? canCel;
  const PopupContainer({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.addItem,
    required this.canCel,
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
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 101, 12),
                  onPressed: () => addItem,
                  // ignore: sort_child_properties_last
                  child: Text(onSave),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 101, 12),
                  onPressed: () => canCel,
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
