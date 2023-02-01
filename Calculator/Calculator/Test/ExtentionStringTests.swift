//
//  ExtentionStringTests.swift
//  ExtentionStringTests
//
//  Created by kokkilE on 2023/01/30.
//

import XCTest
@testable import Calculator

final class ExtentionStringAndDoubleTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_split호출시_입력인자기준으로분할된배열을반환한다() {
        // given
        let input = "12a34a56"
        let expectation = ["12", "34", "56"]
        
        // when
        let result = input.split(with: "a")
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
