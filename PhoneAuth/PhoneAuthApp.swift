//
//  PhoneAuthApp.swift
//  PhoneAuth
//
//  Created by ZISACHMAD on 18/05/21.
//

import SwiftUI
import Firebase
import StreamChat


@main
struct PhoneAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    @AppStorage("userName") var storedUser = ""
    @AppStorage("log_Status") var logStatus = ""
    
    func application(_ aplication: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}

extension ChatClient {
    static var shared: ChatClient!
}
