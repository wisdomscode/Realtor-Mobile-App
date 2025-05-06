import 'package:flutter/material.dart';
import 'package:realtor/bottom_nav_bar.dart';
import 'package:realtor/screens/auth/register_screen.dart';
import 'package:realtor/screens/features/home_screen.dart';
import 'package:realtor/widgets/button_widget.dart';
import 'package:realtor/widgets/custom_text_field_widget.dart';
import 'package:realtor/widgets/custom_text_widget.dart';
import 'package:realtor/widgets/social_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordObscured = true;
  String name = '';

  void loginFunction() {
    print('Hello');
    print(emailController.text);

    setState(() {
      name = emailController.text;
    });

    // Alert Message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Success \nLogin Successfully",
          style: TextStyle(color: Colors.green.shade700),
        ),
        backgroundColor: Colors.green.shade200,
        duration: Duration(seconds: 2),
      ),
    );
    // implement authenticatioin
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomNavBarPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const CustomTextWidget(
                text: 'Login',
                fontSize: 25,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              CustomTextWidget(
                text: (name == '') ? 'Welcome back!' : 'Welcome $name!',
                fontSize: 20,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email Can Not be empty";
                  }
                  return null;
                },
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password Can Not be empty";
                  }
                  return null;
                },
                obscureText: isPasswordObscured,
                label: const Text('Password'),
                prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.deepPurpleAccent,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObscured = !isPasswordObscured;
                      });
                    },
                    icon: isPasswordObscured
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.deepPurpleAccent,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.deepPurpleAccent,
                          )),
              ),
              const SizedBox(height: 20),
              CustomButtonWidget(
                name: 'Login',
                submit: () {
                  if (_formKey.currentState!.validate()) {
                    loginFunction();
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CustomTextWidget(text: 'Not Registered? '),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                          },
                          child: const CustomTextWidget(
                            text: 'Register',
                            color: Colors.deepPurpleAccent,
                          )),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const CustomTextWidget(
                        text: 'Forgot Password?',
                        color: Colors.deepPurpleAccent,
                      )),
                ],
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.black)),
                  SizedBox(width: 10),
                  Text('or Continue with'),
                  SizedBox(width: 10),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 40),
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
    );
  }
}
