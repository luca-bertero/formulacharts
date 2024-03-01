import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback zoomAction;
  const ZoomButton({super.key, required this.zoomAction, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () => zoomAction(),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: Icon(icon, color: Colors.blue,) 
              ),
            );
  }
}