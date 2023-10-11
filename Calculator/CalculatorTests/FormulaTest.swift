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

    func test_operator가_add일때_1_2전달하며_calculate호출시_반환값이3인지() throws {
        let expectation: Double = 10
        
        sut.operands.enqueue(value: 10)
    
        sut.operators.enqueue(value: .add)
        sut.operands.enqueue(value: 20)
        
        sut.operands.enqueue(value: 5)
        sut.operators.enqueue(value: .subtract)
        
        sut.operands.enqueue(value: 5)
        sut.operators.enqueue(value: .divide)

        sut.operands.enqueue(value: 2)
        sut.operators.enqueue(value: .multiply)

        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
}
