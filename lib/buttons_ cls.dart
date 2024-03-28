import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildAppBarButton('Latest', () => null,
              'lib/asset/Screenshot 2024-03-27 172145.png')
        ],
      ),
    );
  }

  Widget _buildAppBarButton(
      String label, Function() onPressed, String imagePath) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 24, // Adjust the height of the image as needed
            width: 24, // Adjust the width of the image as needed
          ),
          SizedBox(
              width: 8), // Adjust the spacing between image and text as needed
          Text(label),
        ],
      ),
    );
  }
}
