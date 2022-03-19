//
//  FomulaTests.swift
//  CalculatorTests
//
//  Created by 김동욱 on 2022/03/19.
//

import XCTest
@testable import Calculator

class FomulaTests: XCTestCase {

    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result() {
        sut.operands.append(newNode: 3)
        sut.operands.append(newNode: 2)
        sut.operands.append(newNode: 4)
        
        sut.operators.append(newNode: Operator(rawValue: Character("+")))
        sut.operators.append(newNode: Operator(rawValue: Character("-")))
        
        XCTAssertEqual(sut.result(), 1)
    }
}
