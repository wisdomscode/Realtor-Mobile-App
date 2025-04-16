import 'package:flutter/material.dart';

class CustomSocialButtonWidget extends StatelessWidget {
  const CustomSocialButtonWidget({
    super.key,
    required this.name,
    required this.image,
    required this.submit,
  });

  final String name;
  final String image;
  final VoidCallback submit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: submit,
      child: Ink(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 1.0, color: Colors.blueGrey),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 70),
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
