import 'package:flutter/material.dart';

import 'package:free_checklist_app/models/checklist.dart';
import 'package:free_checklist_app/models/checklist_item.dart';

Checklist shopping = Checklist(
  id: 1,
  listName: 'Shopping List',
);

Checklist drugStore = Checklist(
  id: 2,
  listName: 'Drug Store List',
);

ChecklistItem shoppingItem1 = ChecklistItem(
  id: 1,
  checklistId: shopping.id,
  itemName: 'Milk',
);

ChecklistItem shoppingItem2 = ChecklistItem(
  id: 2,
  checklistId: shopping.id,
  itemName: 'Bread',
);

ChecklistItem drugStoreItem1 = ChecklistItem(
  id: 3,
  checklistId: drugStore.id,
  itemName: 'Aspirin',
);

ChecklistItem drugStoreItem2 = ChecklistItem(
  id: 4,
  checklistId: drugStore.id,
  itemName: 'Bandages',
);

class ChecklistWidget extends StatefulWidget {
  const ChecklistWidget({super.key});

  @override
  State<ChecklistWidget> createState() => _ChecklistWidgetState();
}

class _ChecklistWidgetState extends State<ChecklistWidget> {
  final List<Checklist> _checklists = [shopping, drugStore];
  final List<ChecklistItem> _shoppingItems = [shoppingItem1, shoppingItem2];
  final List<ChecklistItem> _drugStoreItems = [drugStoreItem1, drugStoreItem2];

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
        onReorder: _onReorder);
  }
}
