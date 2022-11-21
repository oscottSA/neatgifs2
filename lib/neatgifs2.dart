import 'package:flutter/material.dart';

import 'views/home_page.dart';

class NeatGifs2 extends StatelessWidget {
  const NeatGifs2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}
