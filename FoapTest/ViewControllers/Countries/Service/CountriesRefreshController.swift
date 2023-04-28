//
//  CountriesRefreshController.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import UIKit
import Combine

final class CountriesRefreshController {
  init(tableViewController: UITableViewController, countriesProvider: CountriesProvidable) {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    tableViewController.tableView.addSubview(refreshControl)
    tableViewController.refreshControl = refreshControl

    self.refreshControl = refreshControl
    self.countriesProvider = countriesProvider

    stateCancellable = countriesProvider.statePublisher.sink { [weak self] newState in
      if newState != .fetching {
        self?.refreshControl?.endRefreshing()
      }
    }
  }

  func beginRefreshing() {
    refreshControl?.beginRefreshing()
  }

  func endRefreshing() {
    refreshControl?.endRefreshing()
  }

  @objc private func refreshData() {
    countriesProvider?.fetchCountries()
  }

  private weak var refreshControl: UIRefreshControl?
  private weak var countriesProvider: CountriesProvidable?
  private var stateCancellable: AnyCancellable?
}
