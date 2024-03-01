import 'package:flutter/material.dart';
import 'package:web_f1/Router/hero_route.dart';
import 'package:web_f1/View/Component/tutorial_screen.dart';

  FloatingActionButton getHelpFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () { 
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 233, 233, 233),
                  child: const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TutorialScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },  
      child: const Hero(
        tag: "tutorial",
        child: Icon(Icons.question_mark)
      ),
    );
  }
