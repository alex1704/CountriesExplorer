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
    countries = PreviewUtils.getAllCountriesBasicInfo()
  }
}

