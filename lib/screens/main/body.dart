import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _state.todos != null ? _state.todos.length : 0,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text(_state.todos[index].title,
            style: TextStyle(
                decoration: _state.todos[index].done == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        subtitle: Text(_state.todos[index].description),
        onTap: () {
          _state.updateTodo(index: index, todo: _state.todos[index]);
        },
        onLongPress: () {
          _state.removeTodo(index);
        },
      ),
    );
  }
}
