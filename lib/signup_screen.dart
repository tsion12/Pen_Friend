import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

// import 'constants.dart';
// import 'bottom_nav.dart';
var authData = {'email': '', 'password': '', 'cpassword': '', 'penName': ''};
final _form = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Container(
            // height: 900,
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
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Image(
                    width: 300,
                    image: AssetImage('images/logintitle.png'),
                  ),
                ),
                Form(
                  key: _form,
                  child: Container(
                    height: 700,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: ReusedTextFormField(
                                hint: 'Email',
                                index: 'email',
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: ReusedTextFormField(
                                hint: 'confirm password',
                                index: 'cpassword',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_saveForm()) {
                                      await signUp(
                                        ///////////////
                                        authData['penName'],
                                        ////////////////
                                        authData['email'],
                                        authData['password'],
                                      ).then((value) {
                                        Navigator.pushReplacementNamed(
                                            context, 'login');
                                      }).onError((error, stackTrace) {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return AlertDialog(
                                                title: Text(' Signup error'),
                                                content: Text(
                                                    'faild to create user account'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('ok'))
                                                ],
                                              );
                                            });
                                      });
                                    }
                                  },
                                  child: Text('CREATE AN ACCOUNT'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      shape: StadiumBorder())),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 0),
                            child: Center(
                              child: Text(
                                '_______________________ or __________________________',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            margin: EdgeInsets.only(top: 5),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('google tapped');
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 80,
                                      child: ImageIcon(
                                        AssetImage('images/google1.png'),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 50,
                                        height: 80,
                                        child: ImageIcon(
                                            AssetImage('images/phone.png'))),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
      onFieldSubmitted: (_) {
        _form.currentState.save();
      },
      onSaved: (value) {
        authData[index] = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return '        please fill the feild';
        }
        if (index == 'email') {
          final validator = ValidationBuilder().email().maxLength(50).build();
          return validator(value);
        }
        if (index == 'password') {
          Pattern pattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Enter valid password';
          }
        }
        if (index == 'cpassword') {
          if (value != authData['password']) {
            return 'password doesn\'t match ';
          }
        }
        return null;
      },
    );
  }
}

Future<void> signUp(penName, email, password) async {
  var url = Uri.parse("http://10.0.2.2:5000/signup/");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'penName': penName,
      'email': email,
      'password': password
    }),
  );
  print(response.body);
  if (response.statusCode != 201) {
    throw Exception('failed to create user account');
  }
}
