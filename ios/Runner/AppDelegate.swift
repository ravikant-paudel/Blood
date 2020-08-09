import UIKit
import Flutter
import Firebase

// var isAlreadyLaunchedOnce = false

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
   FirebaseApp.configure()
//    if !isAlreadyLaunchedOnce {
  //      FirebaseApp.configure()
    //isAlreadyLaunchedOnce = true
   // }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
