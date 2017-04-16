//
//  ViewController.swift
//  Example
//
//  Created by InJung Chung on 2017. 4. 16..
//  Copyright © 2017 InJung Chung. All rights reserved.
//

import UIKit
import PagingTableView

class MainViewController: UIViewController {

  @IBOutlet weak var contentTable: PagingTableView!

  let contentDataSource = ContentDataSource()
  var contents: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    contentTable.dataSource = self
    contentTable.pagingDelegate = self
  }

}

extension MainViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contents.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
    guard contents.indices.contains(indexPath.row) else { return cell }
    cell.content = contents[indexPath.row]
    return cell
  }

}

extension MainViewController: PagingTableViewDelegate {

  func paginate(_ tableView: PagingTableView, to page: Int) {
    contentTable.isLoading = true
    contentDataSource.loadData(at: page) { contents in
      self.contents.append(contentsOf: contents)
      self.contentTable.isLoading = false
    }
  }

}
