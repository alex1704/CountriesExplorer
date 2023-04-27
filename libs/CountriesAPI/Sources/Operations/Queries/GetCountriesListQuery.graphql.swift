// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCountriesListQuery: GraphQLQuery {
  public static let operationName: String = "GetCountriesList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetCountriesList {
        countries {
          __typename
          code
          name
        }
      }
      """#
    ))

  public init() {}

  public struct Data: CountriesAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("countries", [Country?]?.self),
    ] }

    public var countries: [Country?]? { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountriesAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountriesAPI.Objects.Country }
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
