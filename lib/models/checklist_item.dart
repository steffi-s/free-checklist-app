/// ChecklistItem represents an item in a checklist, with a title and a completion status.
class ChecklistItem {
  final int id;
  final int checklistId; // Foreign key to associate with a specific checklist
  final String itemName;
  final bool isCompleted = false;

  ChecklistItem({
    required this.id,
    required this.checklistId,
    required this.itemName,
  });
}
