// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new3/view/registeration.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var formKey = GlobalKey<FormState>();
  int index = 0;
  var emailTextControler = TextEditingController();
  var passwoerdTextControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                  child: TextFormField(
                    validator: ( value) {
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
            
                    },
                    // onSaved: (value){
                    //   name = value;
                    // },
                    controller: emailTextControler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: 'E-mail',
                      hintText: 'Enter E-mail',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
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
                    controller: passwoerdTextControler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                    overlayColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {},
                  child: Text('LOGIN'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registeration(),
                            ));
                      },
                      child: Text('GO TO SIGN-UP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
