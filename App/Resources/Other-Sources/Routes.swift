//
//  Routes.swift
//  App
//
//  Created by Hiroshi Kuwabara on 7/1/16.
//  Copyright © 2016 sandbox.io. All rights reserved.
//

import Foundation
import URLNavigator

enum Routes: String {
  case Root = "/"
  case Intro = "/intro/"
  case Articles = "/articles/<category>"

  static func entries() -> AnySequence<Routes> {
    typealias S = Routes
    return AnySequence { () -> AnyGenerator<S> in
      var raw = 0
      return AnyGenerator {
        let current: Routes = withUnsafePointer(&raw) { UnsafePointer($0).memory }
        guard current.hashValue == raw else { return nil }
        raw += 1
        return current
      }
    }
  }

  func path(withScheme: Bool = false) -> URLConvertible {
    if withScheme {
      return "\(Routes.scheme())://\(self.rawValue)"
    } else {
      return self.rawValue as URLConvertible
    }
  }

  static func draw() {
    Navigator.scheme = self.scheme()!

    let productName: String? = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String

    for route in self.entries() {
      let klass: AnyClass? = NSClassFromString("\(productName!).\(route)ViewController")
      if let viewController: URLNavigable.Type = klass.self as? URLNavigable.Type {
        Navigator.map(route.rawValue, viewController)
      }
    }
  }

  static func showModal(URL: URLConvertible, from: UIViewController) {
    Navigator.presentURL(URL, wrap: true, from: from, animated: true, completion: nil)
  }

  static func open(URL: URLConvertible) {
    Navigator.openURL(URL)
  }

  static func push(URL: URLConvertible) {
    Navigator.pushURL(URL)
  }

  static func scheme() -> String? {
    let plist = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
    let info = NSDictionary(contentsOfFile: plist!)
    return info?["CFBundleURLTypes"]?[0]?["CFBundleURLSchemes"]?![0] as? String
  }
}
