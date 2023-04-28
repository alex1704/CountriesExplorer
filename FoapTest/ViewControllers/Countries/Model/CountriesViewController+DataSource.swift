//
//  CountriesViewController+DataSource.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import UIKit
import Combine

extension CountriesViewController {
  /// Hookup tableView data source with CountriesProvidable.
  // `DataSource` observers `CountriesProvidable.countries` property and populate table with it
  final class DataSource {
    init(tableView: UITableView, countriesProvider: some CountriesProvidable) {
      let cellID = "cellID"
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
      diffableDataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = itemIdentifier.cellConfiguration
        return cell
      }
      tableView.dataSource = diffableDataSource

      countriesCancellable = countriesProvider.countriesPublisher.sink { [weak self] countries in
        self?.update(countries: countries, animation: true)
      }
    }

    // MARK: - Private

    private let diffableDataSource: UITableViewDiffableDataSource<Int, CountryBasicInfo>
    private var countriesCancellable: AnyCancellable?
  }
}

// MARK: - Helpers
extension CountriesViewController.DataSource {
  private func update(countries: [CountryBasicInfo], animation: Bool = false) {
    var snapshot = NSDiffableDataSourceSnapshot<Int, CountryBasicInfo>()
    snapshot.appendSections([0])
    snapshot.appendItems(countries)

    diffableDataSource.apply(snapshot, animatingDifferences: animation)
  }
}
