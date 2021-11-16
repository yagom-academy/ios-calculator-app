//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/17.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testThreeAddSix() throws {
        sut.operands.insert(3)
        sut.operands.insert(6)
        sut.operators.insert(.add)
        
        let calculatedResult = try sut.result()
        let expectedResult: Double = 9
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
}
