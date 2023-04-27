import 'package:flutter/material.dart';
import 'package:the_movie/core/constants.dart';

class CNoImageProvidedWidget extends StatelessWidget {
  const CNoImageProvidedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: firstColor,
      child: const Center(
          child: Text(
        'No image',
        style: TextStyle(fontSize: 14, color: Colors.white),
      )),
    );
  }
}
