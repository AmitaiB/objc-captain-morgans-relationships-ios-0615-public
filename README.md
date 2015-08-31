---
tags: coredata,relationships,segue
languages: objc
---

# Captain Morgans relationships

## Instructions

  1. Open up the Xcode project file.
  2. Create three entities. Pirate, Ship, Engine.
  3. Pirates have many ships, and a name.
  4. Ships have one Pirate and one Engine and a name.
  5. Engines have an NSString type ("sail, gas, electric, etc.") and one ship.
  6. Setup all three entities with relationships. 
  7. In your dataStore, write the implementation for `generateTestData` and `fetchData`.  
  8. Make sure everything shows up!

## Advanced

  * Add two plus `UIBarButtonItems`. One on the pirates `tableviewcontroller` and one on the ships `tableviewcontroller`. When you click the plus it should go to a new `uiviewcontroller` that allows you to add a pirate, or a ship (with an engine!) to that pirate.
