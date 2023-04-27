//
//  CountryListProviderMock.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation

struct CountryListProviderMock: CountriesProvidable {
  private(set) var countries: [CountryBasicInfo] = []

  init() {
    retrieve()
  }

  private mutating func retrieve() {
    guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let container = try? JSONDecoder().decode(ContainerData.self, from: data),
          let countries = container.data["countries"]
    else {
      return
    }

    self.countries = countries
  }
}

// MARK: - Entities
extension CountryListProviderMock {
  private struct ContainerData: Decodable {
    let data: [String: [CountryBasicInfo]]
  }
}
