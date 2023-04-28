// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CountriesAPI

public class State: MockObject {
  public static let objectType: Object = CountriesAPI.Objects.State
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<State>>

  public struct MockFields {
    @Field<String>("code") public var code
    @Field<String>("name") public var name
  }
}

public extension Mock where O == State {
  convenience init(
    code: String? = nil,
    name: String? = nil
  ) {
    self.init()
    self.code = code
    self.name = name
  }
}
