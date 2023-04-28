//
//  CountriesAPITests.swift
//  FoapTestTests
//
//  Created by Alex Kostenko on 28.04.2023.
//

import XCTest
import ApolloTestSupport
import CountriesAPI
import CountriesAPITestMocks

final class CountriesAPITests: XCTestCase {
  func testGetCountriesListQuery() throws {
    let query = Mock<Query>(
      countries: [Mock<Country>(code: "UA", name: "Ukraine")]
    )

    let result = GetCountriesListQuery.Data.from(query)
    let country = try XCTUnwrap(result.countries?[0])
    XCTAssert(country.code == "UA")
    XCTAssert(country.name == "Ukraine")
  }

  func testGetCountryDetailsQuery() throws {
    let continent = Mock<Continent>(code: "EU", name: "Europe")
    let language = Mock<Language>(code: "uk", name: "Ukrainian", native: "Українська", rtl: 0)
    let state = Mock<State>(code: "ODS", name: "Odesa")

    let query = Mock<Query>(
      country: Mock<Country>(
        code: "UA",
        continent: continent,
        currency: "UAH",
        languages: [language],
        name: "Ukraine",
        native: "Україна",
        phone: "380",
        states: [state]
      )
    )

    let result = try XCTUnwrap(GetCountryDetailsQuery.Data.from(query).country)

    XCTAssert(result.code == "UA")
    XCTAssert(result.continent?.code == "EU")
    XCTAssert(result.continent?.name == "Europe")
    XCTAssert(result.currency == "UAH")

    let resultLang = try XCTUnwrap(result.languages?[0])
    XCTAssert(resultLang.code == "uk")
    XCTAssert(resultLang.name == "Ukrainian")
    XCTAssert(resultLang.native == "Українська")
    XCTAssert(resultLang.rtl == 0)

    XCTAssert(result.name == "Ukraine")
    XCTAssert(result.native == "Україна")
    XCTAssert(result.phone == "380")

    let resultState = try XCTUnwrap(result.states?[0])
    XCTAssert(resultState.code == "ODS")
    XCTAssert(resultState.name == "Odesa")
  }
}
