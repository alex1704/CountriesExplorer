//
//  CountryListProvider.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation

protocol CountriesProvidable {
  var countries: [CountryBasicInfo] { get }
}

struct CountryListProvider: CountriesProvidable {
  private(set) var countries: [CountryBasicInfo] = []
}
