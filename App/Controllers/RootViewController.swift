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
import Then
import SnapKit
import Shared
import PageMenu

class RootViewController: UIViewController, URLNavigable {

  private lazy var pageMenu: CAPSPageMenu = {
    CAPSPageMenu(viewControllers: RootViewController.pages(), frame: self.view.frame, options: nil)
  }()

  required init?(URL: URLConvertible, values: [String : AnyObject]) {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()
    view.addSubview(pageMenu.view)
    layout()
  }

  // レイアウト定義
  private func layout() {
  }
}

extension RootViewController {
  static func pages() -> [UIViewController] {
    return [
      ArticlesViewController.init(URL: "", values: [:])!
    ]
  }
}
