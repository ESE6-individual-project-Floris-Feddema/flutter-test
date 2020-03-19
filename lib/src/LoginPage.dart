import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Theme.of(context).primaryColor, Colors.blue],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              0,
              0,
              0,
              0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                  ),
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                            ),
                            child: Text(
                              'Mooie login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                            ),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                )
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                            ),
                            child: RaisedButton(
//                            color: Theme.of(context).primaryColor,
                              child: Text(
                                'Sign in!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black
                                ),
                              ),
                              onPressed: onSignInPressed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            child: Text(
                              'Other options',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                            ),
                            child: OutlineButton(
                              child: Text(
                                'Sign up!',
                                style: TextStyle(
                                    fontSize: 20,
                                ),
                              ),
                              onPressed: onSignUpPressed,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            child: OutlineButton(
                              child: Text(
                                'Password forgotten',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: onPasswordForgotten,
                            ),
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

  Future<void> onSignInPressed() async {
    if (!validate()) return;
    var response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200){
      final snackbar = SnackBar(
        content: Text(
          'succesful request done',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        duration: Duration(
            milliseconds: 3000
        ),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }

  }

  void onSignUpPressed(){

  }

  void onPasswordForgotten(){

  }

  bool validate() {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
      final snackbar = SnackBar(
        content: Text(
          'The given credentials are incorrect',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        duration: Duration(
            milliseconds: 3000
        ),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

