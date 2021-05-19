import 'package:flutter/material.dart';
void main() {
  runApp(
      new MaterialApp(
          home: new Scaffold(
              appBar: new AppBar(title: new Text('Lecture 1')),
              body: new StudentPage('Vlad Posyniak', 'IP-z82')
          )
      )
  );
}


class StudentPage extends StatelessWidget{
  String _name;
  String _class;

  StudentPage(String _name, String _class) {
    this._name = _name;
    this._class = _class;
  }

  Widget build(BuildContext context) {
    return new Center(child: new Column(
        children: [
          new Text(getName()),
          new Text(getClass()),
        ]
    ));
  }

  String getName() {
    return 'Name:' + _name;
  }
  String getClass() {
    return 'Class:' + _class;
  }
}