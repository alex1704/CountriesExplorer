//
//  CountryDetailsViewController.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import UIKit
import SwiftUI

final class CountryDetailsViewController: UIViewController {
  var basicInfo: CountryBasicInfo?
  var detailsProvider: CountryDetailsProvidable = CountryDetailsProvider()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.title = basicInfo?.name ?? "Unknown"
    setupViews()
    fetchDetails()
  }

  private let infoView = CountryDetailsView(frame: .zero)
  private let retryButton = UIButton(configuration: UIButton.Configuration.borderedProminent())
}

// MARK: - Helpers
extension CountryDetailsViewController {
  fileprivate func fetchDetails() {
    guard let countryId = basicInfo?.code else {
      return
    }

    Task {
      do {
        let info = try await detailsProvider.fetchDetails(forCode: countryId)
        updateView(with: info)
      } catch {
        PopupNotification.show(withText: error.localizedDescription, isError: true)
        showRetryButton()
      }
    }
  }

  private func updateView(with config: CountryDetailsConfig) {
    infoView.update(with: config)
    UIView.animate(withDuration: 0.3) { [weak self] in
      self?.infoView.layer.opacity = 1
      self?.retryButton.layer.opacity = 0
    }
  }

  private func showRetryButton() {
    UIView.animate(withDuration: 0.3) { [weak self] in
      self?.infoView.layer.opacity = 0
      self?.retryButton.layer.opacity = 1
    }
  }

  private func setupViews() {
    view.backgroundColor = .white
    view.addSubview(infoView)
    view.addSubview(retryButton)
    infoView.translatesAutoresizingMaskIntoConstraints = false
    retryButton.translatesAutoresizingMaskIntoConstraints = false
    infoView.layer.opacity = 0
    retryButton.layer.opacity = 0

    retryButton.setTitle(NSLocalizedString("Retry", comment: "Retry button title"),
                         for: .normal)
    retryButton.addTarget(self, action: #selector(didTouchRetry), for: .touchUpInside)

    NSLayoutConstraint.activate([
      infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
    ])

    NSLayoutConstraint.activate([
      retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      retryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}

// MARK: - Handlers
extension CountryDetailsViewController {
  @objc private func didTouchRetry() {
    fetchDetails()
    UIView.animate(withDuration: 0.3, delay: 0.6) { [weak self] in
      self?.retryButton.layer.opacity = 0
    }
  }
}

struct CountryDetailsViewController_Preview: PreviewProvider {
  static var previews: some View {
    ZStack {
      NavigationView {
        ZStack {
          Color.teal
          Preview()
        }
      }
    }

  }

  struct Preview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
      let controller = CountryDetailsViewController()
      controller.basicInfo = .init(name: "Ukraine", code: "UA")
      controller.detailsProvider = detailsProvider

      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        controller.fetchDetails()
      }

      return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    @State private var detailsProvider = CountryDetailsProviderMock()
  }
}
