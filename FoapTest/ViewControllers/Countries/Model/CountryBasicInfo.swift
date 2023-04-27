//
//  CountryBasicInfo.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation

struct CountryBasicInfo: Hashable, Decodable {
  let name: String
  let code: String
}

extension CountryBasicInfo {
  var cellConfiguration: CountryCellConfiguration {
    .init(name: name, code: code)
  }
}
