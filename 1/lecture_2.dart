import 'package:flutter/material.dart';
void main() {
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
              appBar: new AppBar(title: new Text('Lecture 2')),
              body: new StudentPage('vlad', 'ip-z82')
          )
      )
  );
}


class StudentPage extends StatelessWidget with TextHelper{
  String _name;
  String _class;

  StudentPage([String _name = 'Default name', String _class = 'default class']) {
    this._name = _name;
    this._class = _class;
  }

  Widget build(BuildContext context) {
    assert(_name != null);
    assert(_class != null);

    List <Widget> data = [];
    data.add(new Text(concatanate(_name, _class)));
    return new Center(child: new Column(
        children: data
    ));
  }

  String getName() {
    return 'Name:' + _name;
  }
  String getClass() {
    return 'Class:' + _class;
  }
}

mixin TextHelper{
  String concatanate(String string1, String string2) {
    return string1 + ' ' + string2;
  }
}