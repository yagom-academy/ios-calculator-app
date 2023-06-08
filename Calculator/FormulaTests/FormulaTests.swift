//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Hemg on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        operands = nil
        operators = nil
    }
    
    
    func test_2_5_더했을때_7인지_확인() {
        //given
        operands.enqueue(item: 2.0)
        operands.enqueue(item: 5.0)
        operators.enqueue(item: .add)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 7)
    }
}
