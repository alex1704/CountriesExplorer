//
//  BackendClient.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import Foundation
import Apollo

struct BackendClient {
  static func new() -> ApolloClient {
    ApolloClient(url: URL(string: "https://countries.trevorblades.com/graphql")!)
  }

  private init() {}
}
