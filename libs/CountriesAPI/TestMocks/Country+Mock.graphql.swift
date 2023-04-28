// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CountriesAPI

public class Country: MockObject {
  public static let objectType: Object = CountriesAPI.Objects.Country
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Country>>

  public struct MockFields {
    @Field<String>("code") public var code
    @Field<Continent>("continent") public var continent
    @Field<String>("currency") public var currency
    @Field<[Language?]>("languages") public var languages
    @Field<String>("name") public var name
    @Field<String>("native") public var native
    @Field<String>("phone") public var phone
    @Field<[State?]>("states") public var states
  }
}

public extension Mock where O == Country {
  convenience init(
    code: String? = nil,
    continent: Mock<Continent>? = nil,
    currency: String? = nil,
    languages: [Mock<Language>?]? = nil,
    name: String? = nil,
    native: String? = nil,
    phone: String? = nil,
    states: [Mock<State>?]? = nil
  ) {
    self.init()
    self.code = code
    self.continent = continent
    self.currency = currency
    self.languages = languages
    self.name = name
    self.native = native
    self.phone = phone
    self.states = states
  }
}
