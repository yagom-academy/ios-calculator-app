//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by tae hoon park on 2021/06/28.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut = Calculator()
    override func setUpWithError() throws {
    
    }

    func test_1더하기2더하기3의연산결과는_6이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "+", "2", "+", "3"]),.success(6.0))
    }
    
    
    override func tearDownWithError() throws {
  
    }


}
