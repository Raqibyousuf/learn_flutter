import 'package:flutter/material.dart';
import '../models/survey.dart';

class AddSurveyScreen extends StatefulWidget {
  const AddSurveyScreen({super.key});

  @override
  State<AddSurveyScreen> createState() => _AddSurveyScreenState();
}
class _AddSurveyScreenState extends State<AddSurveyScreen> {
  final shopController = TextEditingController();
  final widthController = TextEditingController();
  final heightController = TextEditingController();
  final notesController = TextEditingController();
  final imageController = TextEditingController();

  void saveSurvey() {
    double width =
        double.tryParse(widthController.text) ?? 0;

    double height =
        double.tryParse(heightController.text) ?? 0;

    Survey survey = Survey(
      shopName: shopController.text,
      width: widthController.text,
      height: heightController.text,
      notes: notesController.text,
      area: width * height,
      imagePath: imageController.text.isEmpty
          ? null
          : imageController.text,
    );

    
    Navigator.pop(context,survey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Survey"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: shopController,
              decoration: const InputDecoration(
                labelText: "Shop Name",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Width (ft)",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (ft)",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: "Notes",
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 10),

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: "Image URL",
                hintText: "Paste image link here",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveSurvey,
              child: const Text("Save Survey"),
            ),
          ],
        ),
      ),
    );
  }
}