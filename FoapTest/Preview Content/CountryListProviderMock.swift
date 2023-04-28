//
//  CountryListProviderMock.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation
import Combine

final class CountryListProviderMock: CountriesProvidable, ObservableObject {
  @Published private(set) var state = CountriesProviderState.idle
  @Published private(set) var countries: [CountryBasicInfo] = []

  var countriesPublisher: Published<[CountryBasicInfo]>.Publisher {
    _countries.projectedValue
  }

  var statePublisher: Published<CountriesProviderState>.Publisher {
    _state.projectedValue
  }

  func fetchCountries() {
    state = .fetching
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      if self.count % 2 == 0 {
        self.state = .error("Testable error goes here")
      } else {
        self.countries = PreviewUtils.getAllCountriesBasicInfo()
        self.state = .idle
      }

      self.count += 1
    }
  }

  private var count = 1
}

