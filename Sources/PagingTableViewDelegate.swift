//
//  PagingTableViewDelegate.swift
//  PagingTableView
//
//  Created by 정인중 on 2017. 4. 16..
//  Copyright © 2017년 InJung Chung. All rights reserved.
//

import UIKit

public protocol PagingTableViewDelegate: class {

  func didPaginate(_ tableView: PagingTableView, to page: Int)
  func paginate(_ tableView: PagingTableView, to page: Int)
  
}
