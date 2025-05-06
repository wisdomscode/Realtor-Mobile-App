import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  // fetch data from API
  Future<List<Map<String, dynamic>>> fetchData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      return List<Map<String, dynamic>>.from(responseBody);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final posts = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    title: Text(
                      post['title'],
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text(post['body']),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
