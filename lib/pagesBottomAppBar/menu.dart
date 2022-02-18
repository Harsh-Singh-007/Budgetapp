import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Settings")),
      body: Container(
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
