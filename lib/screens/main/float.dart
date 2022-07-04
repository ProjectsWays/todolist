import 'package:flutter/material.dart';
import 'main_screen.dart';
import '../../models/todo.dart';

class Float extends StatelessWidget {
  const Float({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () {
            _onPressedAdd(context);
          },
        ),
        FloatingActionButton(
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
            heroTag: null,
            onPressed: () {
              _state.getUserTodos();
            })
      ],
    );
  }

  void _onPressedAdd(BuildContext context) async {
    Todo _todo = await Navigator.pushNamed(context, '/new') as Todo;
    if (_todo != null) {
      print(_todo);
      _state.addTodo(_todo);
    } else
      print("There is not Data for the Todod");
  }
}
