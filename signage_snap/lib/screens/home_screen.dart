import 'package:flutter/material.dart';
import '../models/project.dart';
import 'add_project_screen.dart';
import 'project_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Project> projects = [];

  Future<void> addProject() async {
    final String? name = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddProjectScreen(),
      ),
    );

    if (name != null && name.isNotEmpty) {
      setState(() {
        projects.add(
          Project(
            name: name,
            surveys: [],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SigArt Advertisers"),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
  child: ListTile(
    title: Text(projects[index].name),

    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              projects.removeAt(index);
            });
          },
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),

    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProjectScreen(
            project: projects[index],
          ),
        ),
      );
    },
  ),
);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProject,
        child: const Icon(Icons.add),
      ),
    );
  }
}