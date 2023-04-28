//
//  CountryListProvider.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation
import Apollo
import CountriesAPI
import Combine

protocol CountriesProvidable {
  var countries: [CountryBasicInfo] { get }
  var countriesPublisher: Published<[CountryBasicInfo]>.Publisher { get }
  func fetchCountries()
}

final class CountryListProvider: CountriesProvidable {

  // MARK: - Public

  @Published private(set) var state = State.idle
  @Published private(set) var countries: [CountryBasicInfo] = []
  var countriesPublisher: Published<[CountryBasicInfo]>.Publisher {
    _countries.projectedValue
  }

  func fetchCountries() {
    guard state != .fetching else {
      return
    }

    state = .fetching
    apolloClient.fetch(query: GetCountriesListQuery(), queue: .main) { [weak self] result in
      do {
        guard let countries = try result.get().data?.countries else {
          self?.state = .idle
          return
        }

        self?.countries = countries.compactMap {
          $0?.asBasicInfo
        }

        self?.state = .idle
      } catch {
        self?.state = .error(error.localizedDescription)
      }
    }
  }

  // MARK: - Private

  private var apolloClient = ApolloClient(url: URL(string: "https://countries.trevorblades.com/graphql")!)
}

extension CountryListProvider {
  enum State: Equatable {
    case idle
    case fetching
    case error(String)
  }
}

extension GetCountriesListQuery.Data.Country {
  var asBasicInfo: CountryBasicInfo? {
    guard let name,
          let code
    else {
      return nil
    }

    return .init(name: name, code: code)
  }
}
