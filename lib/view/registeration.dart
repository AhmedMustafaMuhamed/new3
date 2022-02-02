// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new3/view/login.dart';

class Registeration extends StatefulWidget {
  Registeration({Key? key}) : super(key: key);
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  int index = 0;
  var password;
  var confirmPassword;
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var nameControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 45.0, horizontal: 45.0),
                      child: Image.asset(
                        'lib/asset/images/logoAmit.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 40.0),
                    child: TextFormField(
                      validator: (value) {
                        validator:
                        (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        };
                      },
                      controller: nameControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: 'Name',
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 40.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      controller: emailControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: 'E-mail',
                        hintText: 'Enter E-mail',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 40.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please  Enter a Password';
                        } else if (!RegExp(
                                r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                            .hasMatch(value)) {
                          return 'should has at least one letter, one number and one special character';
                        }
                        return null;
                      },
                      controller: passwordControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: 'password',
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 40.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please re-enter password';
                        }
                        print(password.text);
                        print(confirmPassword.text);
                        if (password.text != confirmPassword.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      controller: passwordControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: 'confirm password',
                        hintText: 'connfirm Password',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red[800]!,
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(300, 30),
                      ),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {},
                    child: Text('LOGIN'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'YOU ARE A MEMBER...?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ));
                        },
                        child: Text('GO LOGIN'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
