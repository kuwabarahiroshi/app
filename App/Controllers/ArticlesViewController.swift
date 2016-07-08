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

class ArticlesViewController: UIViewController {

  // 記事一覧のtableView
  private lazy var articlesView: UITableView = UITableView().then {
    $0.dataSource = self
    $0.separatorColor = UIColor.clearColor()

    // reusableセルを登録
    $0.registerClass(MonoColumnArticlesTableViewCell.self,
      forCellReuseIdentifier: MonoColumnArticlesTableViewCell.reuseIdentifier!)
    $0.registerClass(BiColumnArticlesTableViewCell.self,
      forCellReuseIdentifier: BiColumnArticlesTableViewCell.reuseIdentifier!)
    $0.registerClass(TriColumnArticlesTableViewCell.self,
      forCellReuseIdentifier: TriColumnArticlesTableViewCell.reuseIdentifier!)
  }

  required init?(URL: URLConvertible, values: [String : AnyObject]) {
    super.init(nibName: nil, bundle: nil)
    self.title = "test"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()
    view.addSubview(articlesView)
    layout()
  }

  // レイアウト定義
  private func layout() {
    articlesView.snp_makeConstraints { (make) in
      make.size.equalTo(view.snp_size)
    }
  }
}

extension ArticlesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(TriColumnArticlesTableViewCell.reuseIdentifier!)
    if cell == nil {
      Logger.syncLogger.debug("")
      cell = TriColumnArticlesTableViewCell()
    }
    return cell!
  }

  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return nil
  }
}

extension ArticlesViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 80
  }

  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 48
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  }
}
