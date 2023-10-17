//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Hisop on 2023/10/12.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula(operands: CalculateItemQueue<Double>(), operators: CalculateItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_operands에10_20_5_5_2_operators에add_subtract_divide_multiply_추가한뒤_result의_반환값이10인지() throws {
        let expectation: Double = 10
        
        sut.operands.enqueue(value: 10)
        sut.operands.enqueue(value: 20)
        sut.operands.enqueue(value: 5)
        sut.operands.enqueue(value: 5)
        sut.operands.enqueue(value: 2)
        
        sut.operators.enqueue(value: .add)
        sut.operators.enqueue(value: .subtract)
        sut.operators.enqueue(value: .divide)
        sut.operators.enqueue(value: .multiply)

        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
}
