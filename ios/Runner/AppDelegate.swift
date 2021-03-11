import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Fixes build issue https://medium.com/vector-com-mm/how-to-fix-ios-crash-during-the-start-firebase-configure-f3477df3154https://medium.com/vector-com-mm/how-to-fix-ios-crash-during-the-start-firebase-configure-f3477df3154
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}