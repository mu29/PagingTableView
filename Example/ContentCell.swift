//
//  ContentCell.swift
//  PagingTableView
//
//  Created by InJung Chung on 2017. 4. 16..
//  Copyright © 2017 InJung Chung. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

  @IBOutlet weak var contentLbl: UILabel!

  var content: String = "" {
    didSet {
      contentLbl.text = content
    }
  }
  
}
