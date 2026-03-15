import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoContainer extends StatelessWidget {
  final Function(bool?)? onChanged;
  final String itemname;
  final bool checked;
  final Function(BuildContext)? deleteData;

  const TodoContainer({
    super.key,
    required this.onChanged,
    required this.itemname,
    required this.checked,
    required this.deleteData
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.9, 5.0, 10.0, 5.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteData,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: "delete",
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber,
          ),
          child: Row(
            children: [
              Checkbox(value: checked, onChanged: onChanged),

              SizedBox(width: 12),

              Text(itemname),
            ],
          ),
        ),
      ),
    );
  }
}
