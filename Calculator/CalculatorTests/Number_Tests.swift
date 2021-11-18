//
//  Number_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/18.
//

import XCTest
@testable import Calculator

class Number_Tests: XCTestCase {
    var sut = Number()
    var fakeLabel: String = ""
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        sut.value = "0"
        sut.isBiggerThan0 = true 
    }
    
    func test_Number의_초기_Label은_0이다() {
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "0")
    }
}
