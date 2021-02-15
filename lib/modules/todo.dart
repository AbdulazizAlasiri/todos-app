import 'package:flutter/cupertino.dart';

class TodoClass {
  String _title;
  bool _isDone;
  TodoClass(title, {isDone = false}) {
    this._title = title;
    this._isDone = isDone;
  }

  String getTitle() {
    return _title;
  }

  String setTitle(String newTitle) {
    this._title = newTitle;
    return this._title;
  }

  bool isDone() {
    return _isDone;
  }

  bool toggleCompleation() {
    this._isDone = !this._isDone;
    return _isDone;
  }
}
