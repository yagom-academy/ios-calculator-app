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
        sut = Formula(operands: [], operators: [])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_피연산자의개수가연산자의수보다1만큼큰경우결과가잘나오는가() {
        // driven
        sut = Formula(operands: [1, 2, 3, 4, 5], operators: [.multiply, .add, .subtract, .add])

        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 6)
    }
    
    func test_연산자의개수가피연산자의수보다많은경우제곱을하여서결과를반환하는가() {
        // driven
        sut = Formula(
            operands: [1,2,3,4,5],
            operators: [.multiply,.add,.add,.subtract,.multiply, .multiply]
        )
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 256)
    }
    
    func test_연산자의개수가피연산자의수보다적은경우피연산자가있는경우까지계산하여서결과를반환하는가() {
        // driven
        sut = Formula(operands: [1, 2, 3, 4, 5], operators: [.multiply, .add])
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 5)
    }
}
