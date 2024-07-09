import 'package:flutter/material.dart';

class HomeClientScreen extends StatefulWidget {
  final String name;
  const HomeClientScreen({super.key, required this.name})
  @override
  _HomeClientScreen createState()=>_HomeClientScreen();
}

class _HomeClientScreen extends State<HomeClientScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  closeScreen(){
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello ${widget.name}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: closeScreen,
                child: Text('Close'),
              ),
            ],
          ),
        ),
      );
  }
}