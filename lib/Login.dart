import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sample/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDatamatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 29,
                ),
                Image.network(
                    'https://as2.ftcdn.net/v2/jpg/02/79/82/39/1000_F_279823998_qOCGe3uZmlMRdPaUiR2HEttcY2vXK3b0.jpg'),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    label: Text(('UserName')),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    // hintText: 'Username',
                  ),
                  validator: (value) {
                    // if (_isDatamatched) {
                    //   return null;
                    // } else {
                    //   'Username or password doesnot match.';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 2,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text(('Password')),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    // hintText: 'Password',
                  ),
                  validator: (value) {
                    // if (_isDatamatched) {
                    //   return null;
                    // } else {
                    //   'Username or password doesnot match.';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDatamatched,
                      child:const Text(
                        'Error',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('data empty');
                        }

                        // checkLogin(context);
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username or password  match');

      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setBool('Logged', true);
      // Go To Home

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const HomeScreen(),
        ),
      );
    } else {
      print('Username or password doesnot match');
      // final _errorMessage = 'Username or Password doesnot match.';

      // SnackBar

      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.fromARGB(255, 116, 14, 7),
      //   margin: EdgeInsets.all(15),
      //   content: Text(_errorMessage),
      //   duration: Duration(seconds: 5),
      // ));

      // // Alert Dialog

      // showDialog(
      //     context: ctx,
      //     builder: (ctx1) {
      //       return AlertDialog(
      //         title: Text('error'),
      //         content: Text(_errorMessage),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.of(ctx1).pop();
      //             },
      //             child: Text('close'),
      //           ),
      //         ],
      //       );
      //     });

      // //  Show Text
      // setState(() {
      //   _isDatamatched = false;
      // });
    }
  }
}
