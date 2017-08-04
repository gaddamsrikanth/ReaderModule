Steps for reader module integration:
1. Use an existing project or create a new Xcode project.
2. Drag an drop the reader module folder into the Xcode navigator pane where your project-name.xcodeproj is situated.
3. Select “copy items if needed” and “group folder” option from the popup.
4. Create bridging header to import the wrapper class.
5. In the bridging header file import “CVWrapper.h” file.
6. Make sure you specify the proper path of bridging header in build settings.
7. Set “Enable Bitcode” option as No in build settings.
8. Add the following frameworks(Target->General->Linked frameworks and libraries):- 
   - SystemConfiguration
   - Security
   - QuartzCore
   - OpenGLES
   - MediaPlayer
   - AVFoundation
   - AudioToolbox
   - CoreMotion
   - CoreGraphics
   - Foundation
   - CoreMedia
9. To use the scanning controllers, just push or use “ViewController1” from the current view controller or  
make it root view controller in AppDelegate.
10. Please make sure that you have set proper provision profile and bundle identifier , if that fails the module will not work.
11. Add “NSCameraUsageDescription” property in the info.plist file for camera access or else the app will crash.

For label changes:
1. Open the localizable.strings file.
2. Change the corresponding label strings in both the files.

For customization(color):
1. Create an instance of “Customization” class.
2. Call the corresponding methods for changes.

Points to remember:
1. Specifying bundle identifier(found in Target->General->Bundle Identifier)  in the Customization.setBundle() is necessary.
2. Cloud Recognition will not work without internet connection.
3. To load a non-https url through meta data , add : - “NSAppTransportSecurity”  and  “NSAllowsArbitraryLoads” in the info.plist. 
4. This module will not work in simulator.
