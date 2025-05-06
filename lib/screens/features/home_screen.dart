import 'package:flutter/material.dart';
import 'package:realtor/models/dommy_properties.dart';
import 'package:realtor/screens/auth/login_screen.dart';
import 'package:realtor/screens/features/profile_screen.dart';
import 'package:realtor/screens/features/property_detail_screen.dart';
import 'package:realtor/screens/features/setting_screen.dart';
import 'package:realtor/widgets/custom_text_field_widget.dart';
import 'package:realtor/widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["All", "Real Estate", "Apartment", "Duplex", "Bungalow", "Plot"];
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.home),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset("assets/images/realesate_logo.png"),
        ),
        title: const CustomTextWidget(
          text: "RealEstate",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.deepPurpleAccent,
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'setting':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                  break;

                case 'profile':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                  break;
                case 'logout':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'setting',
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(width: 10),
                    Text('Setting'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(width: 10),
                    Text('Profile'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const CustomTextFieldWidget(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      // suffixIcon: Icon(Icons.tune),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.tune),
                    ),
                  ),
                ],
              ),

              // Categories
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(category);
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        child: Chip(
                          label: CustomTextWidget(
                            text: category,
                            color: selectedCategory == category ? Colors.white : Colors.deepPurple,
                          ),
                          backgroundColor: selectedCategory == category ? Colors.deepPurple : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(width: 1.0, color: selectedCategory == category ? Colors.transparent : Colors.deepPurple)),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Featured Items
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: 'Discounted Properties',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newProperties.length,
                  itemBuilder: (context, index) {
                    final newProperty = newProperties[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PropertyDetailScreen(property: newProperty),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  newProperty['image'],
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: 250,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(text: newProperty['title']),
                                    Row(
                                      children: [
                                        CustomTextWidget(
                                          text: '₦${newProperty['price']}',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(width: 100),
                                        CustomTextWidget(text: newProperty['location']),
                                      ],
                                    ),
                                    CustomTextWidget(text: newProperty['description']),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // New Properties
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: 'Recent Properties',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: newProperties.length,
                  itemBuilder: (context, index) {
                    final newProperty = newProperties[index];

                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                newProperty['image'],
                                fit: BoxFit.cover,
                                height: 100,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(text: newProperty['title'], fontSize: 12),
                                  CustomTextWidget(
                                    text: '₦${newProperty['price']}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomTextWidget(
                                    text: newProperty['location'],
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
