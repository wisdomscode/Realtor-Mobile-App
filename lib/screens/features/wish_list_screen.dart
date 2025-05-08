import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realtor/models/post_model.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  // fetch data from API
  // Future<List<Map<String, dynamic>>> fetchData() async {
  //   String url = "https://jsonplaceholder.typicode.com/posts";
  //   // String url = "http://10.0.2.2/php/api_boutique/api/items/all_products.php";
  //   var response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     var responseBody = jsonDecode(response.body);
  //     print(responseBody);
  //     return List<Map<String, dynamic>>.from(responseBody);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // using model
  Future<List<PostModel>> fetchData() async {
    List<PostModel> allPosts = [];
    String url = "https://jsonplaceholder.typicode.com/posts";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      for (var post in responseBody) {
        allPosts.add(PostModel.fromJson(post));
      }
    } else {
      throw Exception('Failed to load data');
    }

    return allPosts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: FutureBuilder(
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
                      post.title,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text(post.body),
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
