//
//  ActivityIndicatorController.swift
//  FoapTest
//
//  Created by Alex Kostenko on 29.04.2023.
//

import UIKit

final class ActivityIndicatorController {
  init(hostView: UIView) {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.color = .white
    activityIndicator.center = hostView.center
    hostView.addSubview(activityIndicator)
    self.activityIndicator = activityIndicator
  }

  func startAnimating() {
    activityIndicator?.startAnimating()
  }

  func stopAnimating() {
    activityIndicator?.stopAnimating()
  }

  deinit {
    activityIndicator?.removeFromSuperview()
  }

  private var activityIndicator: UIActivityIndicatorView?
}
