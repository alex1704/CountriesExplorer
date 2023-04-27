//
//  CountryCellConfiguration.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import UIKit

// MARK: - CellConfig
struct CountryCellConfiguration: UIContentConfiguration {
  let name: String
  let code: String

  func makeContentView() -> UIView & UIContentView {
    CountryCellContent(configuration: self)
  }

  func updated(for state: UIConfigurationState) -> Self {
    self
  }
}
