---
title: DocumentExtensions
layout: page
---

**Summary:** Provides extension methods for the Autodesk Revit API.

## Methods

### GetFamilyTypesByCategoryOrderedByName(Autodesk.Revit.DB.Document,Autodesk.Revit.DB.BuiltInCategory)

**Summary:** Retrieves all family types of the specified category from the given Revit document as an ObservableCollection.

#### Parameters:
- `doc`: The Revit document to search for family types.
- `category`: The BuiltInCategory to filter family types.

#### Returns:
An ObservableCollection containing all FamilySymbol objects representing the specified category.

---

### GetLevelsOrderedByProperty``1(Autodesk.Revit.DB.Document,System.Func{Autodesk.Revit.DB.Level,``0},System.Boolean)

**Summary:** Retrieves all levels from the specified Revit document as an ObservableCollection,
            with dynamic ordering based on a specified property.

#### Parameters:
- `doc`: The Revit document to search for levels.
- `keySelector`: A function to extract a key from a Level for ordering.
- `ascending`: If true, orders levels in ascending order; otherwise, descending.

#### Returns:
An ObservableCollection containing Level objects, ordered dynamically by the specified property.

#### Exceptions:
- `T:ArgumentNullException`: Thrown if the document or keySelector is null.

---

### GetRebarShapes(Autodesk.Revit.DB.Document)

**Summary:** Retrieves all rebar shapes from the specified Revit document.

#### Parameters:
- `doc`: The Revit document to retrieve rebar shapes from.

#### Returns:
A list of RebarShape objects available in the document.

#### Exceptions:
- `T:ArgumentNullException`: Thrown if the provided document is null.

---

### GetRebarBarTypes(Autodesk.Revit.DB.Document)

**Summary:** Retrieves all rebar bar types from the specified Revit document as an ObservableCollection.

#### Parameters:
- `doc`: The Revit document to retrieve rebar bar types from.

#### Returns:
An ObservableCollection containing all RebarBarType objects in the document.

#### Exceptions:
- `T:ArgumentNullException`: Thrown if the provided document is null.

---

### CreateAndPlaceColumnAtPoint(Autodesk.Revit.DB.Document,Autodesk.Revit.DB.XYZ,Autodesk.Revit.DB.FamilySymbol,Autodesk.Revit.DB.Level,Autodesk.Revit.DB.Level)

**Summary:** Prompts the user to select a point and places a column at that point.

#### Parameters:
- `doc`: The Revit document where the column will be placed.
- `uiDoc`: The Revit UI document for user interaction.
- `columnType`: 
- `baseLevel`: 
- `topLevel`: 

#### Returns:
The created column Element, or null if no column was created.

#### Exceptions:
- `T:ArgumentNullException`: Thrown if the provided document or UI document is null.

---

