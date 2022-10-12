import 'package:flutter/material.dart';

class HomeHighlight extends StatelessWidget {
  const HomeHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 275,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/georgia_flag.jpg', // https://unsplash.com/photos/7IKGWMIv4wM
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
