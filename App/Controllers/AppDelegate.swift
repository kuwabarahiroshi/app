//
//  AppDelegate.swift
//  matome-news
//
//  Created by Hiroshi Kuwabara on 6/24/16
//  Copyright (c) 2016 sandbox.io. All rights reserved.
//

import UIKit
import XCGLogger
import URLNavigator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    Routes.draw()
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.rootViewController = Navigator.viewControllerForURL(Routes.Intro.path())
    self.window?.makeKeyAndVisible()
    return true
  }
}
