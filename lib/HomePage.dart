import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'User.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  Future fetchUser() async {
    print('started');
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as List<dynamic>;
    print(json);

    // print(json[0]);
    setState(() {
      users = json
          .map((e) => User(
              Id: e['id'],
              body: e['body'],
              userId: e['userId'],
              title: e['title']))
          .toList();
    });
    print(users);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Internshala Project'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
              height: 300,
              // width: 70,
              // color: Colors.amber,
              child: ListTile(
                leading: Text(users[index].Id.toString()),
                // trailing: Text(users[index].userId.toString()),
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  users[index].title.toString(),
                ),
                subtitle: Text(users[index].body),
              ));
        },
      ),
      // floatingActionButton: FloatingActionButton(onPressed: fetchUser),
      backgroundColor: Colors.purple[100],
    ));
  }
}
