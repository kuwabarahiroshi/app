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
    let params: [CAPSPageMenuOption] = [
      .MenuItemSeparatorWidth(4.3),
      .UseMenuLikeSegmentedControl(true),
      .MenuItemSeparatorPercentageHeight(0.1)
    ]
    return CAPSPageMenu(
      viewControllers: RootViewController.pages(),
      frame: self.view.frame,
      pageMenuOptions: params
    )
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
      Navigator.viewControllerForURL("/articles/headline"),
      Navigator.viewControllerForURL("/articles/news"),
      Navigator.viewControllerForURL("/articles/ocult"),
      Navigator.viewControllerForURL("/articles/xxx"),
      Navigator.viewControllerForURL("/articles/kekkon")
    ].filter { $0 != nil }.map { $0! }
  }
}
