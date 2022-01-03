import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/shareds/constants/CustomColors.dart';
import 'package:gym_app/shareds/constants/preferences_keys.dart';
import 'package:gym_app/shareds/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors().getGradientSeconColor(),
                CustomColors().getGradientMainColor()
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Cadastre-se"),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Nome completo",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                            controller: _confirmInputController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirme a senha Senha",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.white,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              this.showPassword = newValue!;
                            });
                          },
                        ),
                        Text(
                          "Mostrar senha ?",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    RaisedButton(
                      onPressed: () {
                        _doSignUp();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: CustomColors().getActiveSecondaryButton(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    User newUser = User(
        name: _nameInputController.text,
        email: _mailInputController.text,
        password: _passwordInputController.text,
        keepOn: true);

    print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKey.activeUser, json.encode(user.toJson()));
  }
}
