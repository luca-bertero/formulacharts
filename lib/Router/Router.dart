import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_f1/View/error_screen.dart';
import 'package:web_f1/View/homepage.dart';
import 'package:web_f1/View/laptime_chart.dart';
import 'package:web_f1/View/view_base.dart';

class Router{
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final route = GoRouter(
    navigatorKey: _rootNavigatorKey, // default
    initialLocation: "/",
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return ViewBase(
            child: Row(
              children: [
                Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Welcome",
                        style: GoogleFonts.roboto(
                          fontSize: 48 ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Welcome to Formula Charts, the site that offers detailed data and graphics on Formula 1 races.",
                      style: GoogleFonts.roboto(
                        fontSize: 16 ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("To get started, please select a year and a related race from the dropdown menus.",
                      style: GoogleFonts.roboto(
                        fontSize: 16 ),
                      ),
                    ),
                    const Center(child: MyHomePage()),
                  ],
                )
                ),
              ],
            ),
          );
        },
      ),
      GoRoute(
        name: 'chart',
        path: '/:year/:raceNumber',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          if(int.tryParse(state.pathParameters["year"] ?? "null") != null && int.tryParse(state.pathParameters["raceNumber"] ?? "null") != null)
          {
            return LaptimeChart(year: int.parse(state.pathParameters["year"].toString()), raceNumber: int.parse(state.pathParameters["raceNumber"].toString()));
          }
          else
          {
            return const ViewBase(child: ErrorScreen());
          }
        },
      ),      
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>  const ViewBase(child: ErrorScreen()),
  );
}