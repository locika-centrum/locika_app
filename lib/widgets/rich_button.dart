import 'package:flutter/material.dart';

class RichButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const RichButton({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.sentiment_satisfied,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.purple,
              ),
            ),
          ]),
    );
  }
}
