import 'package:flutter/material.dart';

void main() => runApp(DetailsPage());

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
