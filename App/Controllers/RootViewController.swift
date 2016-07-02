//
//  RootViewController.swift
//  App
//
//  Created by Hiroshi Kuwabara on 7/2/16.
//  Copyright © 2016 sandbox.io. All rights reserved.
//

import Foundation
import UIKit
import URLNavigator

class RootViewController: UIViewController, URLNavigable {
  required init?(URL: URLConvertible, values: [String : AnyObject]) {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
  }
}
