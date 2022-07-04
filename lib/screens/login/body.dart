import 'package:flutter/material.dart';

import '../../services/user_service.dart';
import '../../models/user.dart';
import 'login_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextField(
            hint: 'Username',
            icon: Icons.people,
            onChanged: (value) {
              _state.username = value;
              if (_state.showErrorMessage == true)
                _state.showErrorMessage = false;
            }),
        _buildTextField(
            hint: 'Password',
            isObsecure: !_state.showPassword,
            icon: Icons.lock,
            button: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  print(_state.showPassword);
                  _state.showPassword = !_state.showPassword;
                }),
            onChanged: (value) {
              _state.password = value;
              if (_state.showErrorMessage == true)
                _state.showErrorMessage = false;
            }),
        if (_state.showErrorMessage)
          Text(
            'Invalid username or password!',
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        SizedBox(height: 10.0),
        _buildButtons(context)
      ],
    );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Login'),
          onPressed: () async {
            final User _user = await UserService.getUserByLoginAndPassword(
                login: _state.username, password: _state.password);
            if (_user == null) _state.showErrorMessage = true;
            if (_user != null) Navigator.pop(context, _user);
          },
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            _state.showErrorMessage = false;
            Navigator.pop(context, null);
          },
        ),
      ],
    );
  }
}
