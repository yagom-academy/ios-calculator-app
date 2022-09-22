//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by smfc on 22/9/2022.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands에한개의숫자만존재할때_return을호출하여도계산되지않는지확인() {
        // given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [1]), operators: CalculatorItemQueue(enqueueStack: [.add]))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_1과2를더하면_3을반환하는지확인() {
        // given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [1, 2]), operators: CalculatorItemQueue(enqueueStack: [.add]))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_1과2와3을더하면_6을반환하는지확인() {
        // given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [1, 2, 3]), operators: CalculatorItemQueue(enqueueStack: [.add, .add]))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 6)
    }
    
    func test_5에서3을빼는경우_2를반환하는지확인() {
        // given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5, 3]), operators: CalculatorItemQueue(enqueueStack: [.subtract, .subtract]))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_10에서5와2을빼는경우_3를반환하는지확인() {
        // given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [10, 5, 2]), operators: CalculatorItemQueue(enqueueStack: [.subtract, .subtract]))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
}
