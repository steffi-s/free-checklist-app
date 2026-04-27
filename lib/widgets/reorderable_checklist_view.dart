import 'package:flutter/material.dart';

import '../models/checklist.dart';
import '../utils/dummy_lists.dart';

class ReorderableChecklistView extends StatefulWidget {
  const ReorderableChecklistView({super.key});

  @override
  State<ReorderableChecklistView> createState() => _ReorderableChecklistViewState();
}

class _ReorderableChecklistViewState extends State<ReorderableChecklistView> {
  final List<Checklist> _checklists = [shopping, drugStore, travelList];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Checklist checklist = _checklists.removeAt(oldIndex);
      _checklists.insert(newIndex, checklist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
        itemBuilder: (context, index) {
          final checklist = _checklists[index];
          return ListTile(
            key: ValueKey(_checklists.indexOf(checklist)),
            title: Text(checklist.listName),
            leading: ReorderableDragStartListener(
              index: index,
              child: const Icon(
                  Icons.drag_handle,
                  color: Colors.grey
              ),
            ),
          );
        },
        itemCount: _checklists.length,
        onReorder: _onReorder
    );
  }
}
