import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // Column
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('First Text', style: TextStyle(color: Colors.red)),
          const Text('Second Text', style: TextStyle(color: Colors.blue)),

          // Row Widgte
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('First Text', style: TextStyle(color: Colors.red)),
              Text('Second Text', style: TextStyle(color: Colors.blue)),
            ],
          ),

          // Text.rich
          const Text.rich(
            TextSpan(
              text: "My Friends",
              children: [
                TextSpan(text: 'Wisdom', style: TextStyle(color: Colors.orange)),
                TextSpan(text: 'John'),
                TextSpan(text: 'Emma'),
                TextSpan(text: 'Esther'),
              ],
            ),
          ),
          RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: const TextSpan(
              text: "Hello John",
              children: [
                TextSpan(
                    text:
                        'How are you? Hope you are doing well, with your studies, It has been a long time since we last spoke, so i am just calling to say hi.',
                    style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),

          // Image
          Image.asset(
            "assets/images/african_king.jpeg",
            height: 200,
            // fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
