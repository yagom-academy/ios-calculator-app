//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/11.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_더하기_계산이_잘_되는지() {
        sut?.operands.enqueue(1)
        sut?.operands.enqueue(2)
        sut?.operators.enqueue(.add)
        
        XCTAssertEqual(try sut?.result(), 3)
    }
    
    func test_연산자_1개_숫자_1개가_있을_경우_제대로_오류를_뱉는지() {
        sut?.operands.enqueue(1)
        sut?.operators.enqueue(.add)
        
        XCTAssertThrowsError(try sut?.result())
    }
    
    func test_연산자_1개만_있을_경우_제대로_오류를_뱉는지() {
        sut?.operators.enqueue(.add)
        
        XCTAssertThrowsError(try sut?.result())
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_빼기_계산이_잘_되는지() {
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(1)
        sut?.operators.enqueue(.subtract)
        
        XCTAssertEqual(try sut?.result(), 1)
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_나누기_계산이_잘_되는지() {
        sut?.operands.enqueue(6)
        sut?.operands.enqueue(2)
        sut?.operators.enqueue(.divide)
        
        XCTAssertEqual(try sut?.result(), 3)
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_곱하기_계산이_잘_되는지() {
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(4)
        sut?.operators.enqueue(.multiply)
        
        XCTAssertEqual(try sut?.result(), 8)
    }
    
    func test_다양한_연산자와_숫자가_있을_경우_계산이_잘_되는지() {
        sut?.operands.enqueue(3)
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(3)
        sut?.operands.enqueue(2)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.multiply)
        sut?.operators.enqueue(.divide)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.subtract)
        
        XCTAssertEqual(try sut?.result(), 6)
    }
    
    func test_음수가_섞인_다양한_연산자와_숫자가_있을_경우_계산이_잘_되는지() {
        sut?.operands.enqueue(3)
        sut?.operands.enqueue(-2)
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(2)
        sut?.operands.enqueue(3)
        sut?.operands.enqueue(-2)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.multiply)
        sut?.operators.enqueue(.divide)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.subtract)
        
        XCTAssertEqual(try sut?.result(), 6)
    }
    
    func test_다양한_연산자와_음수가_있을_경우_계산이_잘_되는지() {
        sut?.operands.enqueue(-3)
        sut?.operands.enqueue(-2)
        sut?.operands.enqueue(-2)
        sut?.operands.enqueue(-2)
        sut?.operands.enqueue(-3)
        sut?.operands.enqueue(-2)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.multiply)
        sut?.operators.enqueue(.divide)
        sut?.operators.enqueue(.add)
        sut?.operators.enqueue(.subtract)
        
        XCTAssertEqual(try sut?.result(), -6)
    }
}
