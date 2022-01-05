import 'package:amosportfolio/data/github_repos.dart';
import 'package:amosportfolio/models/github_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {

  @override
  Widget build(BuildContext context) {

    final githubRepos = Provider.of<GithubRepos>(context,listen: false);

    return FutureBuilder<AllRepos>(
      future: githubRepos.getRepos(),
      builder: (context,snapshot) {
        if(!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          itemCount: snapshot.data!.githubModel.length,
            itemBuilder: (context, index) {
              return ProjectCard(
                  name: snapshot.data!.githubModel[index].name,
                  desc: snapshot.data!.githubModel[index].description ,
                  stars: (snapshot.data!.githubModel[index].stargazersCount).toString(),
                  shares: (snapshot.data!.githubModel[index].forksCount).toString(),
                  stack: const ['Java']
              );
            }, gridDelegate: const
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        );
      },
    );

  }
}

class ProjectCard extends StatelessWidget {

  final String name;
  final String? desc;
  final String stars;
  final String shares;
  final List<String> stack;
  const ProjectCard({Key? key, required this.name, required
  this.desc, required this.stars, required this.shares,
    required this.stack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black54,
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 100,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(desc??"")
            ],
          ),
        ),
    );
  }
}

