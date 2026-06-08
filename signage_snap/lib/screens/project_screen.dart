
// ============================
// IMPORTS
// ============================

import 'package:flutter/material.dart';

import '../models/project.dart';
import '../models/survey.dart';
import 'add_survey_screen.dart';

// ============================
// PROJECT SCREEN
// ============================

class ProjectScreen extends StatefulWidget {
  final Project project;

  const ProjectScreen({
    super.key,
    required this.project,
  });

  @override
  State<ProjectScreen> createState() =>
      _ProjectScreenState();
}

class _ProjectScreenState
    extends State<ProjectScreen> {

  // ============================
  // EXPANDED SURVEY INDEX
  // ============================

  int? expandedIndex;

  // ============================
  // ADD SURVEY
  // ============================

  Future<void> addSurvey() async {
    final Survey? survey =
        await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const AddSurveyScreen(),
      ),
    );

    if (survey != null) {
      setState(() {
        widget.project.surveys.add(survey);
      });
    }
  }

  // ============================
  // UI
  // ============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
      ),

      body: ListView.builder(
        itemCount:
            widget.project.surveys.length,

        itemBuilder: (context, index) {

          // ============================
          // CURRENT SURVEY
          // ============================

          final survey =
              widget.project.surveys[index];

          // ============================
          // EXPANDABLE SURVEY CARD
          // ============================

          return Card(
            margin: const EdgeInsets.all(8),

            child: ExpansionTile(
              initiallyExpanded:
                  expandedIndex == index,

              onExpansionChanged:
                  (expanded) {
                setState(() {
                  expandedIndex =
                      expanded
                          ? index
                          : null;
                });
              },

              // ============================
              // SURVEY TITLE
              // ============================

              title: Text(
                survey.shopName,
                style: const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              children: [

                // ============================
                // OWNER NAME
                // ============================

                ListTile(
                  title: Text(
                    "👤 Owner: ${survey.ownerName}",
                  ),
                ),

                // ============================
                // OWNER PHONE
                // ============================

                ListTile(
                  title: Text(
                    "📞 ${survey.ownerPhone}",
                  ),
                ),

                // ============================
                // ALTERNATE PHONE
                // ============================

                ListTile(
                  title: Text(
                    "📞 ${survey.alternatePhone}",
                  ),
                ),

                // ============================
                // ADDRESS
                // ============================

                ListTile(
                  title: Text(
                    "📍 ${survey.address}",
                  ),
                ),

                // ============================
                // SIZE
                // ============================

                ListTile(
                  title: Text(
                   "📏 ${survey.width}\" × ${survey.height}\"",
                  ),
                ),

                // ============================
                // AREA
                // ============================

                ListTile(
                  title: Text(
                    "📐 Area: ${survey.area.toStringAsFixed(2)} sq ft",
                  ),
                ),

                // ============================
                // SIGNAGE TYPE
                // ============================

                ListTile(
                  title: Text(
                    "🪧 ${survey.signageType}",
                  ),
                ),

                // ============================
                // NOTES
                // ============================

                ListTile(
                  title: Text(
                    "📝 ${survey.notes}",
                  ),
                ),

                // ============================
                // DATE
                // ============================

                ListTile(
                  title: Text(
                    "📅 ${survey.surveyDate}",
                  ),
                ),

                // ============================
                // DELETE BUTTON
                // ============================

                Padding(
                  padding:
                      const EdgeInsets.only(
                    right: 12,
                    bottom: 12,
                  ),

                  child: Align(
                    alignment:
                        Alignment.centerRight,

                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.delete,
                      ),

                      label: const Text(
                        "Delete Survey",
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red,
                        foregroundColor:
                            Colors.white,
                      ),

                      onPressed: () {
                        setState(() {
                          widget.project
                              .surveys
                              .removeAt(
                                  index);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // ============================
      // ADD SURVEY BUTTON
      // ============================

      floatingActionButton:
          FloatingActionButton(
        onPressed: addSurvey,
        child: const Icon(Icons.add),
      ),
    );
  }
}

