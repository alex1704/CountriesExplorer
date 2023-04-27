//
//  PreviewUtils.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation

struct PreviewUtils {
  static func getAllCountriesBasicInfo() -> [CountryBasicInfo] {
    guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let container = try? JSONDecoder().decode(ContainerData.self, from: data)
    else {
      return []
    }

    return container.data["countries"] ?? []
  }
}

// MARK: - Entities
extension PreviewUtils {
  private struct ContainerData: Decodable {
    let data: [String: [CountryBasicInfo]]
  }
}
