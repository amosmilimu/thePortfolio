import 'package:amosportfolio/utils/drawer.dart';
import 'package:amosportfolio/utils/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navProvider = Provider.of<NavigationProvider>(context,listen: true);

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              width: 200,
              child: const NavigationDrawer(),
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3)
                  ),
                border: Border.all(color: Colors.white,width: 1.0)
              ),
            ),
            Expanded(
                child: navProvider.displayedRoute(),
            )
          ],
        )
      ),
    );
  }
}
