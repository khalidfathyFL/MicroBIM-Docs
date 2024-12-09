---
title: View3DExtensions
layout: page
---

**Summary:** Provides extension methods for creating or retrieving 3D views in the Autodesk Revit API.

## Methods

### SearchOrCreate3DView(Autodesk.Revit.DB.Document,System.String)

**Summary:** Searches for a 3D view with the specified name. If it exists, returns it. Otherwise, creates a new 3D view.

#### Parameters:
- `doc`: The Revit document to search or create the 3D view in.
- `viewName`: The name of the 3D view to search for or create.

#### Returns:
The existing or newly created View3D object.

#### Exceptions:
- `T:ArgumentNullException`: Thrown if the provided document is null.
- `T:InvalidOperationException`: Thrown if a 3D view cannot be created.

---

