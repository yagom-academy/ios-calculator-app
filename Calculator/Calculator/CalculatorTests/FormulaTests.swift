//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 서수영 on 2022/09/28.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operrands: CalculatorItemQueue([2, 4, 8]),
                      operators: CalculatorItemQueue([Operator.substract, Operator.add, Operator.substract]))
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_sdf() {
        let result = sut.result()
        
        XCTAssertEqual(result, -6)
    }
}
