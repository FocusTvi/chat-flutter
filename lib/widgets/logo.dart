import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String message ;

  const Logo({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        child: Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
