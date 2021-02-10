import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  Todo({@required this.text, this.checked = false, @required this.onChanged});
  final String text;
  final bool checked;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Checkbox(
              value: checked,
              onChanged: onChanged,
            )
          ],
        ),
        Divider(
          color: Colors.black,
          height: 3,
        )
      ],
    );
  }
}
