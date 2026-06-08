import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/survey.dart';
import 'add_survey_screen.dart';

class ProjectScreen extends StatefulWidget {
  final Project project;

  const ProjectScreen({super.key, required this.project});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  Future<void> addSurvey() async {
    final Survey? survey = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddSurveyScreen(),
      ),
    );

    if (survey != null) {
      setState(() {
        widget.project.surveys.add(survey);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
      ),
      body: ListView.builder(
        itemCount: widget.project.surveys.length,
        itemBuilder: (context, index) {
          final survey = widget.project.surveys[index];

          return Card(
          child: ListTile(
  title: Text(survey.shopName),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("${survey.width} ft × ${survey.height} ft"),
      Text(
        "Area: ${(survey.area ?? 0).toStringAsFixed(2)} sq ft",
      ),
    ],
  ),
  trailing: IconButton(
    icon: const Icon(Icons.delete, color: Colors.red),
    onPressed: () {
      setState(() {
        widget.project.surveys.removeAt(index);
      });
    },
  ),
),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addSurvey,
        child: const Icon(Icons.add),
      ),
    );
  }
}