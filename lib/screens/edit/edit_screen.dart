import 'bar.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Todo _data;

  get isEditing => _isEditing;

  get data => _data;
  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  Todo _newTodo = Todo();

  get isEditing => widget._isEditing;
  get data => widget._data;
  get newTodo => _newTodo;
  set newTodo(value) => _newTodo = value;

  set setTitle(value) => _newTodo.title = value;
  set setDescription(value) => _newTodo.description = value;
  get done => _newTodo.done;
  set setDone(value) {
    setState(() {
      _newTodo.done = value;
      print("Tap is Done");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          body: Body(
            state: this,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _newTodo = data;
  }
}
