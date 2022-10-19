import 'package:flutter/material.dart';
import 'package:routing/model/model.dart';
import 'package:routing/view.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 5.0,
          shadowColor: Colors.orange,
          leading: Icon(Icons.arrow_back),
          actions: [
            Icon(Icons.menu),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade800,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewPage(
                              name: userList[index].name,
                              age: userList[index].number,
                              imageAsset: userList[index].imgAsset,
                            )));
                  },
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage("${userList[index].imgAsset}"),
                  ),
                  title: Text("${userList[index].name}"),
                  subtitle: Text("${userList[index].number}"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
