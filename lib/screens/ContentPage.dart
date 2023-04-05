import 'package:flutter/material.dart';
import 'package:internshala/models/User.dart';

class ContentPage extends StatelessWidget {
  // const ContentPage({super.key});

  late final User user;
  ContentPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text("Detail Screen"),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'User Id : - ${user.userId}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    maxLines: 1,
                    'Id : - ${user.Id}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ListTile(
              leading: const Text(
                "Title :-",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(user.title.toString()),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Body : - ${user.body}',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
