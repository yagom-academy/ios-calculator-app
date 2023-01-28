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
        sut.operators.enqueue(Operator(rawValue: "+")!)
        sut.operators.enqueue(Operator(rawValue: "*")!)
        let expectedResult = 0
        
        // when
        sut.result()
        let result1 = sut.operators.itemCount
        let result2 = sut.operands.itemCount
        
        // then
        XCTAssertEqual(result1, expectedResult)
        XCTAssertEqual(result2, expectedResult)
    }
    
    func test_result호출시_주어진data의_연산결과가_9이다() {
        // given
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(2))
        sut.operands.enqueue(Double(3))
        sut.operators.enqueue(Operator(rawValue: "+")!)
        sut.operators.enqueue(Operator(rawValue: "*")!)
        let expectedResult: Double = 9
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_주어진data의_연산결과가_1이다() {
        // given
        sut.operands.enqueue(Double(3))
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(2))
        sut.operators.enqueue(Operator(rawValue: "-")!)
        sut.operators.enqueue(Operator(rawValue: "/")!)
        let expectedResult: Double = 1
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_주어진음수data의_연산결과가_8이다() {
        // given
        sut.operands.enqueue(Double(-3))
        sut.operands.enqueue(Double(-1))
        sut.operands.enqueue(Double(-2))
        sut.operators.enqueue(Operator(rawValue: "-")!)
        sut.operators.enqueue(Operator(rawValue: "*")!)
        let expectedResult: Double = 4
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result호출시_주어진부호가다른data의_연산결과가_1이다() {
        // given
        sut.operands.enqueue(Double(-3))
        sut.operands.enqueue(Double(1))
        sut.operands.enqueue(Double(-2))
        sut.operators.enqueue(Operator(rawValue: "+")!)
        sut.operators.enqueue(Operator(rawValue: "/")!)
        let expectedResult: Double = 1
        
        // when
        let result = sut.result()
  
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_operator가subtract이고operands가1일때_result호출하면_minus1이다() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator(rawValue: "-")!)
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
        sut.operators.enqueue(Operator(rawValue: "/")!)
        let expectedResult = true
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result.isNaN, expectedResult)
    }
}
