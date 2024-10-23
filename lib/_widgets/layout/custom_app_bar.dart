import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(40); // Define preferred size

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        title: const Text('Quizz app',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: Text("Made with ❤️ by Darkcode"),
          )
        ],
      ),
    );
  }
}
