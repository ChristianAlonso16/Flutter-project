import 'package:firstapp/global/presentation/widgets/CardWidget.dart';
import 'package:flutter/material.dart';

class MenuAdminScreen extends StatelessWidget {
  final String title;

  const MenuAdminScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body:const CardWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
