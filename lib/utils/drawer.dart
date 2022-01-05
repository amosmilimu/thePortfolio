import 'package:amosportfolio/utils/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //initialize navigator

    final navProvider = Provider.of<NavigationProvider>(context,listen: false);

    return Drawer(
      elevation: 5.0,
      backgroundColor: Colors.black87,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children:  [
          const SizedBox(height: 30,),
          ListTile(
            leading: Image.asset('assets/images/folder.png'),
            title: const Text('My Projects'),
            onTap: () {
              navProvider.setDisplayed(1);
            },
          ),
          const SizedBox(height: 50,),
          ListTile(
            leading: Image.asset('assets/images/clipboard.png'),
            title: const Text('My CV'),
            onTap: () {
              navProvider.setDisplayed(2);
            },
          ),
          const SizedBox(height: 50,),
          ListTile(
            leading: Image.asset('assets/images/file.png'),
            title: const Text('Email Me'),
            onTap: () {
              navProvider.setDisplayed(3);
            },
          ),

          const SizedBox(height: 50,),
          ListTile(
            leading: Image.asset('assets/images/profile.png'),
            title: const Text('About Me'),
            onTap: () {
              navProvider.setDisplayed(4);
            },
          ),

          const SizedBox(height: 50,),

          ListTile(
            leading: Image.asset('assets/images/blogging.png'),
            title: const Text('Blog'),
            onTap: () {
              navProvider.setDisplayed(5);
            },
          ),

          const SizedBox(height: 50,),

          ListTile(
            leading: Image.asset('assets/images/applications.png'),
            title: const Text('Applications'),
            onTap: () {
              navProvider.setDisplayed(6);
            },
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
