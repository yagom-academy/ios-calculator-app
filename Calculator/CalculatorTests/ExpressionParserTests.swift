//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/18.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
  
  func test_parse를_호출시_Formula타입을_반환해야한다() {
    // given when
    let output = ExpressionParser.parse(from: "")
    // then
    XCTAssertTrue(type(of: output) == Formula.self)
  }
}
