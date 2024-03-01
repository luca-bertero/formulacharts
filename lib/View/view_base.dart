import 'package:flutter/material.dart';
import 'package:web_f1/View/Component/help_floating_button.dart';

class ViewBase extends StatefulWidget {
  final Widget? child;
  const ViewBase({super.key, this.child});

  @override
  State<ViewBase> createState() => _ViewBaseState();
}

class _ViewBaseState extends State<ViewBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F1 chart'),
      ),
      body: widget.child,           
      floatingActionButton: getHelpFloatingActionButton(context),
    );
  }
}