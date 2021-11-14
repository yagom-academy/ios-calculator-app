//
//  AddOperatorTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/14.
//

import XCTest
@testable import Calculator

class AddOperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testAddTwoNumbers() {
        let firstNumber = 3.0
        let secondNumber = 6.0
        
        let calculatedResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        XCTAssertEqual(calculatedResult, firstNumber + secondNumber)
    }
}
