## Bottom Sheet for iOS

The Bottom Drawer or Bottom Sheet is a user interface pattern that is used more and more on iOS, showing up in Apple’s own apps like Apple Music and Maps. But as of yet, there is no standard component for app developers to use.

### Implementation
A view controller composition is used to avoid ending up with everything in one big view controller. So a BottomSheetContainerViewController is built that on construction takes two UIViewControllers, one that acts as the main, background UI, and one that acts as the sheet. The sheet view controller is embed on top of the main view controller with a fixed height.
