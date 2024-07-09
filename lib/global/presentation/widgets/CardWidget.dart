import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.home),
        title: const Text('aquí va el body'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Usando ScaffoldMessenger para mostrar un SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Card tapped!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
