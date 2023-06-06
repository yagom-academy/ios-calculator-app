//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Daehoon Lee on 2023/06/06.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_init_Double타입Queue로_operands가초기화되면빈상태로원소를꺼내면_nil을반환한다() {
        // given
        let expectedOperandsQueue: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        // when
        sut.operands = expectedOperandsQueue
        let result: Double? = sut.operands.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_init_Operator타입Queue로_operators가초기화되면빈상태로원소를꺼내면_nil을반환한다() {
        // given
        let expectedOperatorsQueue: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        // when
        sut.operators = expectedOperatorsQueue
        let result: Operator? = sut.operators.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_result_Operands가비었다며_연산결과는_NaN을반환한다() {
        // given
        let expectedOperandsQueue: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        // when
        sut.operands = expectedOperandsQueue
        let result: Double = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result_Operands가NaN하나만있다면_연산결과는_NaN을반환한다() {
        // given
        let expectedOperand: Double = .nan
        
        // when
        sut.operands.enqueue(expectedOperand)
        let result: Double = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result_Operands가1하나만있다면_연산결과는_1을반환한다() {
        // given
        let expectedOperand: Double = 1
        sut.operands.enqueue(expectedOperand)
        sut.operators.enqueue(.add)
        
        // when
        let result: Double = sut.result()
        
        // then
        XCTAssertEqual(result, expectedOperand)
    }
    
    func test_result_operands에1이들어가면_result값으로_1이반환된다() {
        // given
        sut.operands.enqueue(1)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_result_operators에add가들어가면_result는두수를더해_3을반환한다() {
        // given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.add)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_result_operators에subtract가들어가면_result는두수를빼서_1을반환한다() {
        // given
        sut.operands.enqueue(2)
        sut.operands.enqueue(1)
        sut.operators.enqueue(.subtract)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_result_operators에multiply가들어가면_result는두수를곱하여_8을반환한다() {
        // given
        sut.operands.enqueue(2)
        sut.operands.enqueue(4)
        sut.operators.enqueue(.multiply)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 8)
    }
    
    func test_result_operators에divide가들어가면_result는두수를나누어_4를반환한다() {
        // given
        sut.operands.enqueue(8)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.divide)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 4)
    }
    
    func test_result_divide연산에서_0으로나누는경우_NaN을반환한다() {
        // given
        sut.operands.enqueue(10)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result_3입력을_사칙연산으로계산하면_3을반환한다() {
        // given
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.multiply)
        
        // when
        let result: Double = sut.result()
        
        // then
        XCTAssertEqual(result, 3)
    }
}
