import 'package:amosportfolio/data/github_repos.dart';
import 'package:amosportfolio/utils/constants.dart';
import 'package:amosportfolio/utils/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => NavigationProvider()
        ),
        ChangeNotifierProvider(create: (_)
        => GithubRepos())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Constants.newTextTheme(context)
        ),
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
