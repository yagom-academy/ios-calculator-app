//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    var operatorQueue: CalculatorItemQueue<LinkdeList<Operator>>!
    var operandQueue: CalculatorItemQueue<LinkdeList<Double>>!

    override func setUpWithError() throws {
        operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(LinkdeList<Operator>())
        operandQueue = CalculatorItemQueue<LinkdeList<Double>>(LinkdeList<Double>())
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        sut = nil
        operatorQueue = nil
        operandQueue = nil
        
    }
    
    func test_result() {
        // given
        let operatorData = [Operator.add, Operator.subtract, Operator.divide, Operator.multiply]
        let operandData = [1.0, 5.0, 3.0, 4.0, 6.0]
        operatorData.forEach( operatorQueue.enqueue(_:) )
        operandData.forEach(operandQueue.enqueue(_:))

        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, (1+5-3)/4*6)
        
        
    }
    
    

}
