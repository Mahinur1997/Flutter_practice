import 'package:flutter/material.dart';

void main() => runApp(AboutPage());

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
            color: Colors.amber,
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
