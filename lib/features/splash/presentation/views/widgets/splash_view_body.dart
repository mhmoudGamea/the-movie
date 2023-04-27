import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/f.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
