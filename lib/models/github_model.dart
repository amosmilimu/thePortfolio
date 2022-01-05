// To parse this JSON data, do
//
//     final githubModel = githubModelFromJson(jsonString);

import 'dart:convert';

GithubModel githubModelFromJson(String str) => GithubModel.fromJson(json.decode(str));

String githubModelToJson(GithubModel data) => json.encode(data.toJson());

class GithubModel {
  GithubModel({
    required this.name,
    required this.owner,
    this.description,
    required this.fork,
    required this.forksCount,
    required this.stargazersCount,
    required this.watchersCount,
  });

  String name;
  Owner owner;
  String? description;
  bool fork;
  int forksCount;
  int stargazersCount;
  int watchersCount;

  factory GithubModel.fromJson(Map<String, dynamic> json) => GithubModel(
    name: json["name"],
    owner: Owner.fromJson(json["owner"]),
    description: json["description"],
    fork: json["fork"],
    forksCount: json["forks_count"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "owner": owner.toJson(),
    "description": description,
    "fork": fork,
    "forks_count": forksCount,
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
  };
}

class Owner {
  Owner({
    required this.login,
    required this.avatarUrl,
  });

  String login;
  String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "avatar_url": avatarUrl,
  };
}

class AllRepos {
  final List<GithubModel> githubModel;
  AllRepos({
    required this.githubModel
  });

  factory AllRepos.fromJson(List<dynamic> json) {
    List<GithubModel> repoList = [];
    repoList = json.map((e) => GithubModel.fromJson(e)).toList();
    return AllRepos(githubModel: repoList);
  }
}
