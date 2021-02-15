import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;
  AddTaskScreen({@required this.addTaskCallback});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;

  @override
  Widget build(BuildContext context) {
    FlatButton addButton = FlatButton(
      minWidth: 200,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: () {
        widget.addTaskCallback(newTask);
        Navigator.pop(context);
      },
      child: Text(
        'Add',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
      color: Colors.lightBlueAccent,
    );
    return Container(
      color: Colors.black54,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.only(top: 8, left: 40, right: 40, bottom: 50),
        child: Column(
          children: [
            Divider(
              color: Colors.grey.shade400,
              thickness: 4,
              indent: 55,
              endIndent: 55,
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  newTask = value;
                });
              },
              autofocus: true,
              textAlign: TextAlign.center,
              onEditingComplete: () {
                addButton.onPressed();
              },
            ),
            SizedBox(height: 80),
            addButton
          ],
        ),
      ),
    );
  }
}
