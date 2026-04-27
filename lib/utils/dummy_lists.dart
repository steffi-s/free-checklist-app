import '../models/checklist.dart';
import '../models/checklist_item.dart';

 Checklist shopping = Checklist(
  id: 1,
  listName: 'Shopping List',
);

Checklist drugStore = Checklist(
  id: 2,
  listName: 'Drug Store List',
);

Checklist travelList = Checklist(
  id: 3,
  listName: 'Travel List',
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

ChecklistItem travelListItem1 = ChecklistItem(
  id: 5,
  checklistId: travelList.id,
  itemName: 'Passport',
);

ChecklistItem travelListItem2 = ChecklistItem(
  id: 6,
  checklistId: travelList.id,
  itemName: 'Tickets',
);
