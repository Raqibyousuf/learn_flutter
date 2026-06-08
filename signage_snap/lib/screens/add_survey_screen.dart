
// ============================
// IMPORTS
// ============================

import 'package:flutter/material.dart';
import '../models/survey.dart';

// ============================
// ADD SURVEY SCREEN
// ============================

class AddSurveyScreen extends StatefulWidget {
  const AddSurveyScreen({super.key});

  @override
  State<AddSurveyScreen> createState() => _AddSurveyScreenState();
}

class _AddSurveyScreenState extends State<AddSurveyScreen> {

  // ============================
  // CONTROLLERS
  // ============================

  final shopController = TextEditingController();
  final ownerController = TextEditingController();
  final ownerPhoneController = TextEditingController();
  final alternatePhoneController = TextEditingController();
  final addressController = TextEditingController();

  final widthController = TextEditingController();
  final heightController = TextEditingController();

  final notesController = TextEditingController();
  final imageController = TextEditingController();

  // ============================
  // SIGNAGE TYPE DROPDOWN
  // ============================

  String selectedSignageType = "ACP Board";

  final List<String> signageTypes = [
    "ACP Board",
    "Glow Sign Board",
    "LED Sign Board",
    "Acrylic Letter",
    "SS Letter",
    "Flex Board",
    "Neon Sign",
    "PVC Sign",
    "Other",
  ];

  // ============================
  // SAVE SURVEY
  // ============================

  void saveSurvey() {

    double width =
        double.tryParse(widthController.text) ?? 0;

    double height =
        double.tryParse(heightController.text) ?? 0;

    Survey survey = Survey(
      shopName: shopController.text,
      ownerName: ownerController.text,
      ownerPhone: ownerPhoneController.text,
      alternatePhone: alternatePhoneController.text,
      address: addressController.text,

      width: widthController.text,
      height: heightController.text,

      signageType: selectedSignageType,

      notes: notesController.text,

      surveyDate: DateTime.now()
          .toString()
          .split(" ")[0],

      area: (width * height)/144,

      imagePath: imageController.text.isEmpty
          ? null
          : imageController.text,
    );

    Navigator.pop(context, survey);
  }

  // ============================
  // UI
  // ============================

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

            // ============================
            // SHOP NAME
            // ============================

            TextField(
              controller: shopController,
              decoration: const InputDecoration(
                labelText: "Shop Name",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // OWNER NAME
            // ============================

            TextField(
              controller: ownerController,
              decoration: const InputDecoration(
                labelText: "Owner Name",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // OWNER PHONE
            // ============================

            TextField(
              controller: ownerPhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Owner Phone",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // ALTERNATE PHONE
            // ============================

            TextField(
              controller: alternatePhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Alternate Phone",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // ADDRESS
            // ============================

            TextField(
              controller: addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Address",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // WIDTH
            // ============================

            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Width (inches)",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // HEIGHT
            // ============================

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (inches)",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // SIGNAGE TYPE
            // ============================

            DropdownButtonFormField<String>(
              value: selectedSignageType,
              decoration: const InputDecoration(
                labelText: "Signage Type",
              ),
              items: signageTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSignageType = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            // ============================
            // NOTES
            // ============================

            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Notes",
              ),
            ),

            const SizedBox(height: 10),

            // ============================
            // IMAGE URL
            // ============================

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: "Image URL",
              ),
            ),

            const SizedBox(height: 20),

            // ============================
            // SAVE BUTTON
            // ============================

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

