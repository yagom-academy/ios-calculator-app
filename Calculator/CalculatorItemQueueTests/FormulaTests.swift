//
//  FormulaTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_피연산자의개수가연산자의수보다1만큼큰경우결과가잘나오는가() {
        sut.setUpOperands(operands: [1,2,3,4,5])
        sut.setUpOperators(operators: [.multiply,.add,.subtract,.add])
        let result = sut.result()
        
        XCTAssertEqual(result, 25)
    }
    
    func test_피연산자의개수가연산자의수보다작은경우결과가잘나오는가() {
        let result = sut.result()
        
        XCTAssertEqual(result, 20)
    }
}
