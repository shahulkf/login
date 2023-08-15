import 'package:flutter/material.dart';
import 'package:flutter_sample/Login.dart';
import 'package:flutter_sample/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.network(
        'https://www.eventbrite.com/blog/wp-content/uploads/2022/04/GP-socialdistancing-04_Blog-Header-1.png',
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    Future.delayed( const Duration(seconds: 3), () async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      bool isLogged = shared.getBool('Logged') ?? false;
      if (isLogged) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) =>  const HomeScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => Loginscreen(),
          ),
        );
      }
    });
  }

  Future<void> checkUserLoggedIn() async {}
}
