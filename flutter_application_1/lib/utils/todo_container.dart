import 'package:flutter/material.dart';

class TodoContainer extends StatefulWidget {
final Function(bool?)? onChanged;
final String itemname;
final bool checked;


  const TodoContainer({
    super.key,
    required this.onChanged,
    required this.itemname,
    required this.checked
  });

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.9,5.0,10.0,5.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.checked, 
              onChanged: widget.onChanged,
              ),
      
              SizedBox(width: 12),
      
            Text(widget.itemname)
          ],
        ),
      ),
    );
  }
}