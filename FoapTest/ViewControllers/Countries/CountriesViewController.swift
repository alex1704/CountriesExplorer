//
//  CountriesViewController.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import UIKit
import SwiftUI
import Combine

final class CountriesViewController: UITableViewController {
  var countriesProvider: CountriesProvidable = CountryListProvider()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = NSLocalizedString("Countries", comment: "Countries list title")
    dataSource = .init(tableView: tableView, countriesProvider: countriesProvider)
    countriesRefreshController = .init(tableViewController: self, countriesProvider: countriesProvider)
    tableView.rowHeight = 56

    errorCancellable = countriesProvider.statePublisher.sink { newValue in
      if case let .error(description) = newValue {
        PopupNotification.show(withText: description, isError: true)
      }
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    countriesProvider.fetchCountries()
  }

  private var dataSource: DataSource!
  private var countriesRefreshController: CountriesRefreshController?
  private var errorCancellable: AnyCancellable?
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
      controller.countriesProvider = countriesProvider
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        countriesProvider.fetchCountries()
      }
      return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    @StateObject var countriesProvider = CountryListProviderMock()
  }
}
