import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key, this.name, this.age, this.imageAsset}) : super(key: key);
  String? name;
  String? imageAsset;
  int? age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text("Details Page"),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
                child: Image.asset(
              "$imageAsset",
              height: 400.0,
            )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "$name",
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("$age", style: TextStyle(fontSize: 30.0))
          ],
        ),
      ),
    );
  }
}
