import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../models/todo.dart';
import '../../services/todo_service.dart';

import 'bar.dart';
import 'body.dart';
import 'float.dart';

class MainScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (context) => MainScreen());

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  User _user;
  List<Todo> _todos;

  get user => _user;
  set user(value) {
    setState(() {
      _user = value;
      getUserTodos();
    });
  }

  get todos => _todos;
  set todos(value) {
    _todos = value;
    setState(() {});
  }

  void getUserTodos() async {
    if (user != null) todos = await TodoService.getTodoListByUser(user.id);
  }

  void addTodo(Todo todo) async {
    if (user != null) {
      todo.user = user.id;
      await TodoService.addTodo(todo);
      setState(() {
        _todos.add(todo);
      });
    }
  }

  void removeTodo(int index) async {
    if (user != null) {
      await TodoService.removeTodo(_todos[index].id);
      setState(() {
        getUserTodos();
      });
    }
  }

  void updateTodo({int index, Todo todo}) async {
    if (user != null) {
      Todo _todo =
          await Navigator.pushNamed(context, '/edit', arguments: todo) as Todo;

      if (_todo != null) {
        await TodoService.updateTodo(_todo);
      }
      setState(() {
        getUserTodos();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          body: user != null ? Body(state: this) : null,
          floatingActionButton: user != null ? Float(state: this) : null,
        ),
      ),
    );
  }
}
