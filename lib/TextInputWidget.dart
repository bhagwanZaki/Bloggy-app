import 'package:flutter/material.dart';
/////////////////////////////////////////////////////
///////////////// TEXT FIELD ////////////////////////
/////////////////////////////////////////////////////

class TextInputWidget extends StatefulWidget {
  //this is responsible for constructors

  final Function(String) callback;
  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

// this is responsible for all state change
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    FocusScope.of(context).unfocus();
    widget.callback(controller.text); 
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            //button
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: "Post Message ",
              onPressed: this.click,
            )));
  }
}