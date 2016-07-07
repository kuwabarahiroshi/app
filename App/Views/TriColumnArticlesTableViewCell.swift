//
//  TriColumnArticlesTableViewCell.swift
//  App
//
//  Created by Hiroshi Kuwabara on 7/6/16.
//  Copyright © 2016 sandbox.io. All rights reserved.
//

import Foundation
import UIKit

class TriColumnArticlesTableViewCell: UITableViewCell {
  static let reuseIdentifier: String? = "\(self.dynamicType)"

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.backgroundColor = UIColor.blackColor()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
