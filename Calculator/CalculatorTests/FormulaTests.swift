//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Rowan on 2023/01/27.
//

import XCTest

final class FormulaTests: XCTestCase {

    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result호출시_queue의itemCount가0이된다() {
        // given
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(2))
        sut.operands.enqueue(Double(3))
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        let expectedResult = 0
        
        // when
        sut.result()
        let result1 = sut.operators.itemCount
        let result2 = sut.operands.itemCount
        
        // then
        XCTAssertEqual(result1, expectedResult)
        XCTAssertEqual(result2, expectedResult)
    }
    
    func test_result호출시_주어진data의_연산결과가_예측한결과다() {
        // given
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(2))
        sut.operands.enqueue(Double(3))
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        let expectedResult: Double = 9
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_주어진data의_연산결과가_예측한결과다2() {
        // given
        sut.operands.enqueue(Double(3))
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(2))
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.divide)
        let expectedResult: Double = 1
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_operator와operand의개수가같을때_예측한결과가나온다() {
        // given
        sut.operands.enqueue(Double(2))
        sut.operands.enqueue(Double(5))
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.subtract)
        let expectedResult: Double = -7
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_주어진부호가다른data의_예측한결과다() {
        // given
        sut.operands.enqueue(Double(-3))
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(-2))
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.divide)
        let expectedResult: Double = 1
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_operator가subtract이고operands가1일때_result호출하면_minus1이다() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue(.subtract)
        let expectedResult: Double = -1
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_0으로나누는식이전달될때_result호출시_NaN이반환된다() {
        // given
        sut.operands.enqueue(1)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        let expectedResult = true
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result.isNaN, expectedResult)
    }
    
    func test_주어진조건에서_result호출시_예측한결과다() {
        // given
        sut.operands.enqueue(-1)
        sut.operands.enqueue(1)
        sut.operands.enqueue(3)
        sut.operands.enqueue(22)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.multiply)
        let expectedResult: Double = -66
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
}
