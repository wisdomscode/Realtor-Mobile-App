import 'package:flutter/material.dart';
import 'package:realtor/screens/auth/login_screen.dart';
import 'package:realtor/screens/auth/register_screen.dart';
import 'package:realtor/widgets/button_widget.dart';
import 'package:realtor/widgets/social_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/house6.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Discover Your \nDream Home', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),

            // bottom container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text('Login in to continue!'),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonWidget(
                            name: 'Login',
                            submit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          CustomButtonWidget(
                            name: 'Register',
                            bgColor: Colors.white,
                            textColor: Colors.black,
                            submit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.black)),
                          SizedBox(width: 10),
                          Text('or login with'),
                          SizedBox(width: 10),
                          Expanded(child: Divider(color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   label: Text('Upload'),
                      //   icon: Icon(Icons.upload),
                      // ),

                      CustomSocialButtonWidget(
                        name: 'Google',
                        image: "assets/images/google.png",
                        submit: () {
                          print('Google clicked');
                        },
                      ),
                      const SizedBox(height: 20),

                      CustomSocialButtonWidget(
                        name: 'Facebook',
                        image: "assets/images/facebook.png",
                        submit: () {
                          print('Facebook clicked');
                        },
                      ),
                      const SizedBox(height: 20),

                      CustomSocialButtonWidget(
                        name: 'Apple',
                        image: "assets/images/apple.png",
                        submit: () {
                          print('Apple clicked');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
