//
//  CountriesViewController.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import UIKit
import SwiftUI

final class CountriesViewController: UITableViewController {
  var countriesProvider: CountriesProvidable = CountryListProvider()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = NSLocalizedString("Countries", comment: "Countries list title")
    dataSource = .init(tableView: tableView, countriesProvider: countriesProvider)
    tableView.rowHeight = 56
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    countriesProvider.fetchCountries()
  }

  private var dataSource: DataSource!
}

struct CountriesViewController_Preview: PreviewProvider {
  static var previews: some View {
    ZStack {
      NavigationView {
        Preview()
        // lines that setup title should not be provided but SwiftUI preview
        // do not show values set in `viewDidLoad`
          .navigationTitle("Countries")
          .navigationBarTitleDisplayMode( .large)
      }
    }
    .ignoresSafeArea()
  }

  struct Preview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
      let controller = CountriesViewController()
      controller.countriesProvider = CountryListProviderMock()
      return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
  }
}
