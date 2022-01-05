import 'package:amosportfolio/models/github_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;

class GithubRepos extends ChangeNotifier {
   Future<AllRepos> getRepos() async {
    var url =
      Uri.parse('https://api.github.com/users/amosmilimu/repos');
    var response = await http.get(url);
    return AllRepos.fromJson(convert.jsonDecode(response.body));
  }
}