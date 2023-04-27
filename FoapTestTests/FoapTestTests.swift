//
//  FoapTestTests.swift
//  FoapTestTests
//
//  Created by Alex Kostenko on 27.04.2023.
//

import XCTest
@testable import FoapTest

final class FoapTestTests: XCTestCase {
  func testEmojiFlagGeneration() throws {
    let countries = PreviewUtils.getAllCountriesBasicInfo()

    countries.forEach {
      XCTAssertNotNil($0.code.asEmojiFlag)
    }
  }
}
