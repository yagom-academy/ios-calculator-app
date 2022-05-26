//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by Kiwi on 2022/05/20.
//

import XCTest
@testable import Calculator
class FormulaTest: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자를_집어넣었을때_연산이_정상적으로_작동하는지() {
        //given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 3.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .substract)
        //when
        let result = try? sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_정수값하나와_하나의_연산자를_집어넣었을때_정수값의_변화가_없어야한다() {
        //given
        sut.operands.enqueue(data: 2.0)
        
        sut.operators.enqueue(data: .multiply)
        //when
        let result = try? sut.result()
        //then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_정수값의_갯수가_연산자의수보다_2개이상_많으면_에러를_반환해야한다() {
        // given
        sut.operands.enqueue(data: 4.0)
        sut.operands.enqueue(data: 3.0)
        sut.operands.enqueue(data: 5.0)
        
        sut.operators.enqueue(data: .add)
        
        // when,then
        XCTAssertThrowsError(try sut?.result(), "wrongFormula") { error in
                   XCTAssertEqual(error as? OperatorError, .wrongFormula)
               }
    }
}
