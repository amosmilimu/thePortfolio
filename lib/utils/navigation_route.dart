import 'package:amosportfolio/screens/home_page.dart';
import 'package:amosportfolio/screens/my_cv.dart';
import 'package:amosportfolio/screens/my_projects.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {

  int _displayedIndex = 0;
  int get displayedIndex => _displayedIndex;

  void setDisplayed(int index) {
    _displayedIndex = index;
    notifyListeners();
  }

  Widget displayedRoute() {
      if(displayedIndex == 0) {
        return const HomePage();
      } else if(displayedIndex == 1) {
        return const MyProjects();
      } else if(_displayedIndex == 2) {
        return const MyCV();
      }
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/404.png'),
              const Text('Sorry the page your looking for does not exist')
            ],
          ),
        ),
      );

  }

}