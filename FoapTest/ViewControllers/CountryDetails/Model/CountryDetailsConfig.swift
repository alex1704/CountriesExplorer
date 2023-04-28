//
//  CountryDetailsInfo.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import Foundation
import CountriesAPI

struct CountryDetailsConfig: Hashable, Decodable {
  let name: String // Ukraine (UA)
  let native: String
  let phone: String
  let currency: String
  let continent: String // Europe (EU)
  let languages: String // comma separated list
  let states: String // comma separated list
}

extension GetCountryDetailsQuery.Data.Country {
  var asCountryDetailsConfig: CountryDetailsConfig {
    .init(
      name: "\(name ?? absentValue) (\(code ?? absentValue))",
      native: native ?? absentValue,
      phone: phone ?? absentValue,
      currency: currency ?? absentValue,
      continent: continentValue,
      languages: languagesValue,
      states: stateValue
    )
  }

  private var stateValue: String {
    guard let states else {
      return absentValue
    }

    let parsedStates = states.reduce(into: [String](), { result, state in
      if let name = state?.name {
        result.append(name)
      }
    })

    guard !parsedStates.isEmpty else {
      return absentValue
    }

    return parsedStates.joined(separator: ", ")
  }

  private var languagesValue: String {
    guard let languages else {
      return absentValue
    }

    let parsedLanguages = languages.reduce(into: [String](), { result, language in
      if let name = language?.name {
        result.append(name)
      }
    })

    guard !parsedLanguages.isEmpty else {
      return absentValue
    }

    return parsedLanguages.joined(separator: ", ")
  }

  private var continentValue: String {
    guard let continent else {
      return absentValue
    }

    return "\(continent.name ?? absentValue) (\(continent.code ?? absentValue))"
  }

  private var absentValue: String {
    "-"
  }
}
