//
//  FinaceApplicationApp.swift
//  FinaceApplication
//
//  Created by Jeevan Ghimire on 08/06/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main

struct FinaceApplicationApp: App {
    //Register the firebase Setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
      WindowGroup {
          NavigationStack {
              LoginPage()
          }
      }
    }
}

