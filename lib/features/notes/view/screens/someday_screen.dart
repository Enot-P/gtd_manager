import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SomedayScreen extends StatelessWidget {
  const SomedayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SomedayScreen"),
      ),
    );
  }
}
