//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by marisol on 2022/03/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1에2를더하면_3을리턴한다() {
        let formula = Formula()
    }

}
