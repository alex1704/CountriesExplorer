//
//  CountryDetailsProvider.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import Foundation
import Apollo
import CountriesAPI

protocol CountryDetailsProvidable {
  func fetchDetails(forCode code: String) async throws -> CountryDetailsConfig
}

struct CountryDetailsProvider: CountryDetailsProvidable {
  func fetchDetails(forCode code: String) async throws -> CountryDetailsConfig {
    try await withCheckedThrowingContinuation { continuation in
      apolloClient.fetch(query: GetCountryDetailsQuery(code: code), queue: .main) { result in
        do {
          guard let info = try result.get().data?.country?.asCountryDetailsConfig else {
            throw FetchError.noDataReturned
          }

          continuation.resume(returning: info)
        } catch {
          continuation.resume(throwing: error)
        }
      }
    }
  }

  // MARK: - Private

  private var apolloClient = BackendClient.new()
}

extension CountryDetailsProvider {
  enum FetchError: LocalizedError {
    case noDataReturned

    var errorDescription: String? {
      switch self {
      case .noDataReturned: return NSLocalizedString("No data were returned by server", comment: "Fetch country details error message")
      }
    }
  }
}
