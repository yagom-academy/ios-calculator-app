//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/12.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_더하기_계산이_잘_되는지() {
        sut.operands.appendItem(1)
        sut.operands.appendItem(2)
        sut.operators.appendItem(.add)
        
        XCTAssertEqual(try sut.result(), 3)
    }
    
    func test_연산자_1개_숫자_1개가_있을_경우_제대로_오류를_뱉는지() {
        sut.operands.appendItem(1)
        sut.operators.appendItem(.add)
        
        do {
            try sut.result()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyItem)
    }
    
    func test_연산자_1개만_있을_경우_제대로_오류를_뱉는지() {
        sut.operators.appendItem(.add)
        
        do {
            try sut.result()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyItem)
    }
    
    func test_숫자_1개만_있을_경우_제대로_오류를_뱉는지() {
        sut.operands.appendItem(1)
        
        do {
            try sut.result()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyItem)
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_빼기_계산이_잘_되는지() {
        sut.operands.appendItem(2)
        sut.operands.appendItem(1)
        sut.operators.appendItem(.subtract)
        
        XCTAssertEqual(try sut.result(), 1)
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_나누기_계산이_잘_되는지() {
        sut.operands.appendItem(6)
        sut.operands.appendItem(2)
        sut.operators.appendItem(.divide)
        
        XCTAssertEqual(try sut.result(), 3)
    }
    
    func test_연산자_1개_숫자_2개가_있을_경우_곱하기_계산이_잘_되는지() {
        sut.operands.appendItem(2)
        sut.operands.appendItem(4)
        sut.operators.appendItem(.multiply)
        
        XCTAssertEqual(try sut.result(), 8)
    }
    
    func test_다양한_연산자와_숫자가_있을_경우_계산이_잘_되는지() {
        sut.operands.appendItem(3)
        sut.operands.appendItem(2)
        sut.operands.appendItem(2)
        sut.operands.appendItem(2)
        sut.operands.appendItem(3)
        sut.operands.appendItem(2)
        sut.operators.appendItem(.add)
        sut.operators.appendItem(.multiply)
        sut.operators.appendItem(.divide)
        sut.operators.appendItem(.add)
        sut.operators.appendItem(.subtract)
        
        XCTAssertEqual(try sut.result(), 6)
    }
}
