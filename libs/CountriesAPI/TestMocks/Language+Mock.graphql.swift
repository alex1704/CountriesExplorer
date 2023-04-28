// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CountriesAPI

public class Language: MockObject {
  public static let objectType: Object = CountriesAPI.Objects.Language
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Language>>

  public struct MockFields {
    @Field<String>("code") public var code
    @Field<String>("name") public var name
    @Field<String>("native") public var native
    @Field<Int>("rtl") public var rtl
  }
}

public extension Mock where O == Language {
  convenience init(
    code: String? = nil,
    name: String? = nil,
    native: String? = nil,
    rtl: Int? = nil
  ) {
    self.init()
    self.code = code
    self.name = name
    self.native = native
    self.rtl = rtl
  }
}
