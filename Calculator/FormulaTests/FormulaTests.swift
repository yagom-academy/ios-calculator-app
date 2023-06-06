//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Hemg on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        operators = nil
    }
    
    func test_enqueue_값입력후_곱하기하고_formula값이같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .multiply)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 10)
    }
}
