import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/shareds/constants/CustomColors.dart';
import 'package:gym_app/shareds/constants/preferences_keys.dart';
import 'package:gym_app/shareds/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  Color topColor = Colors.blue;
  Color bottomColor = Color.fromARGB(255, 212, 247, 255);
  bool continueConected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSeconColor(),
              bottomColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Image.asset(
                  "assets/icon1.png",
                  height: 125,
                ),
              ),
              Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {
                  print("Funcionou");
                },
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Checkbox(
                    value: this.continueConected,
                    onChanged: (bool? newValue) {
                      setState(() {
                        this.continueConected = newValue!;
                      });
                    },
                  ),
                  Text(
                    "Continuar conectado ?",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    CustomColors().getActivePrimaryButtonColor(),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                // color: CustomColors().getActivePrimaryButtonColor(),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Ainda não tem uma conta ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: CustomColors().getActiveSecondaryButton(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = this._mailInputController.text;
    String passwordForm = this._passwordInputController.text;

    User savedUser = await _getSavedUser();

    if (mailForm == savedUser.email && passwordForm == savedUser.password) {
      print('LOGIN EFETUADO COM SUCESSO');
    } else {
      print(("Falha ao locar"));
    }
  }

  // Future<User> _getSavedUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jsonUser = prefs.getString(PreferencesKey.activeUser);
  //   print(jsonUser);

  //   Map<String, dynamic> mapUser = jsonDecode(jsonUser);

  //   User user = User.fromJson(mapUser);
  //   return user;
  // }
  Future<User> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKey.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    User user = User.fromJson(mapUser);
    return user;
  }
}
