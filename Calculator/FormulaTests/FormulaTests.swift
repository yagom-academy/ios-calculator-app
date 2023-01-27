//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by kimseongjun on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {

    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_result메서드에서_두개의값을_더하기실행하면_더해진값이_반환된다() {
        //given
        let inputOperands: [Double] = [3, 4]
        let inputOperator = Operator.add
        let expectedValue: Double = 7
        //when
        for i in inputOperands {
            sut.operands.enqueue(item: i)
        }
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
}
