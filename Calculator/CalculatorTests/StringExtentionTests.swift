//
//  StringExtentionTests.swift
//  CalculatorTests
//
//  Created by 김동욱 on 2022/03/19.
//

import XCTest
@testable import Calculator

class StringExtentionTests: XCTestCase {
    
    var sut: String!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_String_extention_split() {
        sut = "te sts"
        let result = sut.split(with: " ")
        XCTAssertEqual(result, ["te", "sts"])
    }
}
