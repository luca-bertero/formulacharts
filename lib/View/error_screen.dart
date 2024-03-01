import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Something went wrong! :(",
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed("home"),
              child: const Text("Go back to the home page"),
            ),
          ],
        ),
      );
  }
}
