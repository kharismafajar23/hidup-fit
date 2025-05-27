import 'package:flutter/material.dart';
import 'package:hidup_fit/utils/constant/sizes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.md),
        child: Text('Login'),
      ),
    );
  }
}
