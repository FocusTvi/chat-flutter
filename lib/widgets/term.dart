import 'package:flutter/material.dart';

class Term extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('Términos y condiciones de uso',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w300)));
  }
}
