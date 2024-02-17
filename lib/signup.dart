import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if(value.isEmpty){
                      return "Please enter Username";
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Please enter Password";
                    }
                  }
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Please enter Confirm Password";
                    }
                  }
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if(value.isEmpty){
                      return "Please enter Email Address";
                    }
                  }
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Spacer(),
                    RaisedButton(
                      child: Text('Sign Up'),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}