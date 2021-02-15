import 'package:flutter/material.dart';
import 'package:todoey_flutter/utlity/todo.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Map> todos = [
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
    {'text': 'ergergewrgwerg', 'checked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen())));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 40, right: 40, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.list,
                        size: 30,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '12 Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: UniqueKey(),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          todos.removeAt(index);
                        });

                        // Show a snackbar. This snackbar could also contain "Undo" actions.
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("${todos[index]['text']} dismissed")));
                      },
                      child: Todo(
                        text: todos[index]['text'],
                        checked: todos[index]['checked'],
                      ),
                    ),
                    itemCount: todos.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
