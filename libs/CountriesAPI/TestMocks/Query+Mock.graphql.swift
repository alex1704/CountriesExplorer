// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CountriesAPI

public class Query: MockObject {
  public static let objectType: Object = CountriesAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<[Country?]>("countries") public var countries
    @Field<Country>("country") public var country
  }
}

public extension Mock where O == Query {
  convenience init(
    countries: [Mock<Country>?]? = nil,
    country: Mock<Country>? = nil
  ) {
    self.init()
    self.countries = countries
    self.country = country
  }
}
