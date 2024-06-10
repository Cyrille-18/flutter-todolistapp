import 'package:flutter/material.dart';
import 'package:mytodolistapp/models/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.tache,
  });

  final Task tache;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3), // Border width
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 252, 252, 252),
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tache.title),
                Icon(tache.statut ? Icons.check : Icons.block),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(tache.description)),
                Icon(Icons.delete)
              ],
            ),
            Row(
              children: [
                Text(tache.date.toString()),
              ],
            )
          ],
        ));
  }
}
