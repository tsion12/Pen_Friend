import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var authData = {'email': '', 'password': ''};

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();

  bool _saveForm() {
    final _isValid = _form.currentState.validate();
    if (!_isValid) {
      return false;
    }
    _form.currentState.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (token != null && token != '') {
        Navigator.pushNamed(context, 'main');
      }
    }

    checkToken();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage(
                  'images/reachinghands.jpg',
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                child: Image(
                  width: 300,
                  image: AssetImage('images/logintitle.png'),
                ),
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: ReusedTextFormField(
                          hint: 'Email,PenName or Phone',
                          index: 'email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: ReusedTextFormField(
                            hint: 'Password',
                            index: 'password',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_saveForm()) {
                              await login(
                                      authData['email'], authData['password'])
                                  .then((value) {
                                //print(value);
                                if (value == 0) {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: Text('invalid login'),
                                          content: Text(
                                              'Invalid login please try again!'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ok'))
                                          ],
                                        );
                                      });
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, 'main');
                                }
                              });
                            }
                          },
                          child: Text('LOGIN'),
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.secondary,
                              shape: StadiumBorder()),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(),
                        SizedBox(
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      child: Text(
                        'SignUp now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusedTextFormField extends StatelessWidget {
  ReusedTextFormField({@required this.hint, @required this.index});
  final String hint;
  final String index;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              style: BorderStyle.solid,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        authData[index] = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return '        please fill the feild';
        }
        return null;
      },
    );
  }
}

Future<int> login(email, password) async {
  Uri url = Uri.parse("http://10.0.2.2:5000/login/");
  try {
    var response = await http.post(
      url,
      headers: <String, String>{
        'content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 400) {
      // print('invalid login');
      return 0;
    }
    var parse = jsonDecode(response.body);
    // print(parse['token']);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', parse['token']);
    print(prefs.getString('token'));
  } catch (error) {
    print(error);
  }

  return 1;
}
