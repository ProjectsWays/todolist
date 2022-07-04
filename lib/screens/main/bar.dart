import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _state.user == null
          ? CircleAvatar(backgroundImage: AssetImage('assets/unknown_user.png'))
          : CircleAvatar(backgroundImage: NetworkImage(_state.user.photoUrl)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Todo List'),
          _state.user == null
              ? Text('The user is Unknown ', style: TextStyle(fontSize: 12.0))
              : Text(_state.user.name, style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [
        _state.user == null
            ? IconButton(
                icon: Icon(Icons.login),
                onPressed: () async {
                  _state.user = await Navigator.pushNamed(context, '/login');
                })
            : IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onPressed: () async {
                  _state.user = null;
                  _state.todos = null;
                })
      ],
    );
  }
}
