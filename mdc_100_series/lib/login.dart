// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _usernameError;
  String _passwordError;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 72.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 128.0),
            new TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Username",
                errorText: _usernameError,
              ),
            ),
            const SizedBox(height: 16.0),
            new TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
                errorText: _passwordError,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            new ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  child: Text("Cancel"),
                ),
                new FlatButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    if (username.isNotEmpty && password.isNotEmpty) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        _usernameError = "Username required";
                        _passwordError = "Password required";
                      });
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
