//
//  PreviewUtils.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation
import CountriesAPI
import Apollo
import ApolloTestSupport
import CountriesAPITestMocks

struct PreviewUtils {
  static func getAllCountriesBasicInfo() -> [CountryBasicInfo] {
    guard let container: AllCountriesContainerData = loadResource("countries", withExtension: "json") else {
      return []
    }

    return container.data["countries"] ?? []
  }

  /// Could not figured out how to instantiate GetCountryDetailsQuery.Data.Country from json
  /// so used Mock to create one
  static func uaDetails(code: String) -> CountryDetailsConfig {
    let mock = Mock<Query>(
      country: Mock<Country>(
        code: code,
        continent: Mock<Continent>(code: "EU", name: "Europe"),
        currency: "UAH",
        languages: [Mock<Language>(code: "uk", name: "Ukrainian")],
        name: "Ukraine",
        native: "Україна",
        phone: "380",
        states: [Mock<State>(code: "71", name: "Odesa")]
      )
    )

    let model = GetCountryDetailsQuery.Data.from(mock)
    return model.country!.asCountryDetailsConfig
  }

  static func loadResource<T: Decodable>(_ resource: String, withExtension ext: String) -> T? {
    guard let url = Bundle.main.url(forResource: resource, withExtension: ext),
          let data = try? Data(contentsOf: url),
          let container = try? JSONDecoder().decode(T.self, from: data)
    else {
      return nil
    }

    return container
  }
}

// MARK: - Entities
extension PreviewUtils {
  fileprivate struct AllCountriesContainerData: Decodable {
    let data: [String: [CountryBasicInfo]]
  }
}
