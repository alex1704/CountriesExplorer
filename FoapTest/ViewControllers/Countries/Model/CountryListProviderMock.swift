//
//  CountryListProviderMock.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation
import Combine

final class CountryListProviderMock: CountriesProvidable {
  @Published private(set) var countries: [CountryBasicInfo] = []
  var countriesPublisher: Published<[CountryBasicInfo]>.Publisher {
    _countries.projectedValue
  }

  func fetchCountries() {}

  init() {
    countries = PreviewUtils.getAllCountriesBasicInfo()
  }
}

