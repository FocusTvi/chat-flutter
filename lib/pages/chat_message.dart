import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;

  const ChatMessage({Key? key,required this.texto, required this.uid}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child:  this.uid == '123' ? _myMessage() : _notMyMessage(),
    );
  }

 Widget _myMessage() {

return Align(
  alignment: Al,
)


 }
}
