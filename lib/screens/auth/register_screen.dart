import 'package:flutter/material.dart';
import 'package:realtor/screens/auth/login_screen.dart';
import 'package:realtor/widgets/button_widget.dart';
import 'package:realtor/widgets/custom_text_field_widget.dart';
import 'package:realtor/widgets/custom_text_widget.dart';
import 'package:realtor/widgets/social_button_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: 'Regisstration',
              fontSize: 25,
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: 'Welcome!, Register to continue',
            ),
            const SizedBox(height: 20),
            const CustomTextFieldWidget(
              label: Text('Full Name'),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextFieldWidget(
              label: Text('Email'),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextFieldWidget(
              label: Text('Password'),
              prefixIcon: Icon(
                Icons.key,
                color: Colors.deepPurpleAccent,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextFieldWidget(
              label: Text('Confirm Password'),
              prefixIcon: Icon(
                Icons.key,
                color: Colors.deepPurpleAccent,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            CustomButtonWidget(
              name: 'Register',
              submit: () {},
            ),
            Row(
              children: [
                CustomTextWidget(text: 'Already Registered? '),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: CustomTextWidget(
                      text: 'Login Here',
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
    );
  }
}
