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
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "input to do item",
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 101, 12),
                  onPressed: () => addItem?.call(context),
                  child: Text(onSave),
                ),
                const SizedBox(width: 10),
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 101, 12),
                  onPressed: () => canCel?.call(context),
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