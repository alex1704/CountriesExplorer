//
//  CountryDetailsProviderMock.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import Foundation

final class CountryDetailsProviderMock: CountryDetailsProvidable {
  func fetchDetails(forCode code: String) async throws -> CountryDetailsConfig {
    count += 1
    if count % 2 == 0 {
      throw FetchError.testableError
    } else {
      return PreviewUtils.uaDetails(code: code)
    }
  }

  private var count = 0
}

extension CountryDetailsProviderMock {
  enum FetchError: LocalizedError {
    case testableError

    var errorDescription: String? {
      switch self {
      case .testableError: return "Testable error goes here"
      }
    }
  }
}
