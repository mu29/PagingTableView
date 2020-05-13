//
//  PagingTableView.swift
//  PagingTableView
//
//  Created by InJung Chung on 2017. 4. 16..
//  Copyright © 2017 InJung Chung. All rights reserved.
//

import UIKit

open class PagingTableView: UITableView {

  private var loadingView: UIView!
  private var indicator: UIActivityIndicatorView!
  internal var page: Int = 0
  internal var previousItemCount: [Int:Int] = [:]

  open var currentPage: Int {
    get {
      return page
    }
  }

  open weak var pagingDelegate: PagingTableViewDelegate? {
    didSet {
      pagingDelegate?.paginate(self, to: page)
    }
  }

  open var isLoading: Bool = false {
    didSet {
      isLoading ? showLoading() : hideLoading()
    }
  }

  open func reset() {
    page = 0
    previousItemCount = [:]
    pagingDelegate?.paginate(self, to: page)
  }

  private func paginate(_ tableView: PagingTableView, forIndexAt indexPath: IndexPath) {
    let itemCount = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: indexPath.section) ?? 0
    guard indexPath.row == itemCount - 1 else { return }
    guard previousItemCount[indexPath.section] != itemCount else { return }
    page += 1
    previousItemCount[indexPath.section] = itemCount
    pagingDelegate?.paginate(self, to: page)
  }

  private func showLoading() {
    if loadingView == nil {
      createLoadingView()
    }
    tableFooterView = loadingView
  }

  private func hideLoading() {
    reloadData()
    pagingDelegate?.didPaginate?(self, to: page)
    tableFooterView = nil
  }

  private func createLoadingView() {
    loadingView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
    indicator = UIActivityIndicatorView()
    indicator.color = UIColor.lightGray
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.startAnimating()
    loadingView.addSubview(indicator)
    centerIndicator()
    tableFooterView = loadingView
  }

  private func centerIndicator() {
    let xCenterConstraint = NSLayoutConstraint(
      item: loadingView, attribute: .centerX, relatedBy: .equal,
      toItem: indicator, attribute: .centerX, multiplier: 1, constant: 0
    )
    loadingView.addConstraint(xCenterConstraint)

    let yCenterConstraint = NSLayoutConstraint(
      item: loadingView, attribute: .centerY, relatedBy: .equal,
      toItem: indicator, attribute: .centerY, multiplier: 1, constant: 0
    )
    loadingView.addConstraint(yCenterConstraint)
  }

  override open func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
    paginate(self, forIndexAt: indexPath)
    return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
  }

}
