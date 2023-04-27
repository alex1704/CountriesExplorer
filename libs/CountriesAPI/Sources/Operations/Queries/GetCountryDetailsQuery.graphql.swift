// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCountryDetailsQuery: GraphQLQuery {
  public static let operationName: String = "GetCountryDetails"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetCountryDetails($code: ID!) {
        country(code: $code) {
          __typename
          name
          native
          phone
          currency
          code
          continent {
            __typename
            code
            name
          }
          languages {
            __typename
            code
            name
            native
            rtl
          }
          states {
            __typename
            code
            name
          }
        }
      }
      """#
    ))

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var __variables: Variables? { ["code": code] }

  public struct Data: CountriesAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("country", Country?.self, arguments: ["code": .variable("code")]),
    ] }

    public var country: Country? { __data["country"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountriesAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Country }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String?.self),
        .field("native", String?.self),
        .field("phone", String?.self),
        .field("currency", String?.self),
        .field("code", String?.self),
        .field("continent", Continent?.self),
        .field("languages", [Language?]?.self),
        .field("states", [State?]?.self),
      ] }

      public var name: String? { __data["name"] }
      public var native: String? { __data["native"] }
      public var phone: String? { __data["phone"] }
      public var currency: String? { __data["currency"] }
      public var code: String? { __data["code"] }
      public var continent: Continent? { __data["continent"] }
      public var languages: [Language?]? { __data["languages"] }
      public var states: [State?]? { __data["states"] }

      /// Country.Continent
      ///
      /// Parent Type: `Continent`
      public struct Continent: CountriesAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Continent }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String?.self),
          .field("name", String?.self),
        ] }

        public var code: String? { __data["code"] }
        public var name: String? { __data["name"] }
      }

      /// Country.Language
      ///
      /// Parent Type: `Language`
      public struct Language: CountriesAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Language }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String?.self),
          .field("name", String?.self),
          .field("native", String?.self),
          .field("rtl", Int?.self),
        ] }

        public var code: String? { __data["code"] }
        public var name: String? { __data["name"] }
        public var native: String? { __data["native"] }
        public var rtl: Int? { __data["rtl"] }
      }

      /// Country.State
      ///
      /// Parent Type: `State`
      public struct State: CountriesAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.State }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String?.self),
          .field("name", String?.self),
        ] }

        public var code: String? { __data["code"] }
        public var name: String? { __data["name"] }
      }
    }
  }
}
