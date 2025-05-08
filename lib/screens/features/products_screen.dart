import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realtor/models/product_model.dart';
import 'package:realtor/widgets/custom_text_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Reading from api
  Future<List<ProductModel>> fetchData() async {
    String url = "http://10.0.2.2/php/api_boutique/api/items/all_products.php";

    var response = await http.get(Uri.parse(url));
    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> dataList = decoded['itemsRecord'];

      return dataList.map((data) => ProductModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // submiting to api
  Future<void> sumbitProduct() async {
    String url = "http://10.0.2.2/php/api_boutique/api/items/upload.php";

    dynamic content = {
      "name": "Towel",
      "price": "500",
      "rating": "4.6",
      "tags": "Hand,Face",
      "sizes": "S,M,L",
      "colors": "Blue,Pink,Orange",
      "description": "Beautiful hand towels for facial cleaning",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk-iJ7XPfWWy0ZfOfg2i2IR7fUxKA05jv3xQ&s"
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded',
      },
      body: content,
    );

    if (response.statusCode == 200) {
      print('Product submited successfully');
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Success \nProduct sumbitted successfully",
            style: TextStyle(color: Colors.green.shade700),
          ),
          backgroundColor: Colors.green.shade200,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      print('Product fialed to submited');
      print("${response.statusCode}");
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed \nProduct failed to sumbitted Error: ${response.statusCode}",
            style: TextStyle(color: Colors.green.shade700),
          ),
          backgroundColor: Colors.green.shade200,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sumbitProduct();
        },
        child: Icon(Icons.add),
      ),
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

          final products = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                    elevation: 5,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Image.network(
                          product.image,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        text: product.name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(width: 20),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber, size: 20),
                                          CustomTextWidget(
                                            text: product.rating,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  CustomTextWidget(
                                    text: "₦${product.price}",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomTextWidget(
                                    text: product.description,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(text: 'Tag: '),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Wrap(
                                          spacing: 8,
                                          children: product.tags.map((e) => Text("$e, ")).toList(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Wrap(
                            spacing: 8,
                            children: product.sizes.map((e) => Chip(label: Text(e))).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Wrap(
                            spacing: 8,
                            children: product.colors.map((e) => Chip(label: Text(e))).toList(),
                          ),
                        )
                      ],
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
