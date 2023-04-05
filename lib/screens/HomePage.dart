import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:internshala/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:internshala/screens/ContentPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User> users = [];
  @override
  Future fetchUser() async {
    print('started');
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as List<dynamic>;
    // print(json);

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
    // print(users);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Internshala Project',
            style: TextStyle(
              letterSpacing: 1.3,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black26,
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(top: 10),
                height: 200,
                child: ListTile(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentPage(user: users[index]),
                        ));
                  },
                  leading: Container(
                    // padding: const EdgeInsets.only(top: 10.0),
                    margin: EdgeInsets.only(top: 40),
                    child: Text(users[index].Id.toString()),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      users[index].title.toString(),
                    ),
                  ),
                  subtitle: Text(users[index].body),
                ));
          },
        ),
        // floatingActionButton: FloatingActionButton(onPressed: fetchUser),
        backgroundColor: Colors.purple[100],
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black26,
            onPressed: fetchUser,
            child: Text('Fetch ')),
      ),
    );
  }
}
