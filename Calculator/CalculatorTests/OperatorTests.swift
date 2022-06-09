//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Derrick kim on 2022/05/19.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_연산자_add만_분리해서_담을수_있다() {
        do {
            // given
            let array: [Any] = [3.2, Operator.add,
                                2.0, 3.0, 4.0]
            
            let expectation = Operator.add
            // when
            try array.forEach { value in
                guard let value = value as? Operator else {
                    return
                }
                try sut.enqueue(value)
            }
            let result = sut.peekFirst
            // then
            XCTAssertEqual(result, expectation)
            
        } catch {}
    }
    
    func test_연산자_add_rawValue_플러스_만_분리해서_반환하다() {
        do {
            // given
            let array: [Any] = [3.2, Operator.add,
                                2.0, 3.0, 4.0]
            
            let expectation = Operator.add.rawValue
            // when
            try array.forEach { value in
                guard let value = value as? Operator else {
                    return
                }
                try sut.enqueue(value)
            }
            let result = sut.peekFirst?.rawValue
            // then
            XCTAssertEqual(result, expectation)
            
        } catch {}
    }
    
    func test_숫자와_연산자를_통해_순서대로_계산한다() {
        do {
            // given
            let array1: [Any] = [3.0, Operator.add,
                                 2.0, Operator.multiply, 4.0]
            
            let operands = CalculatorItemQueue<Double>()
            
            let expectation: Double = 20
            // when
            try array1
                .map{
                    if let value = $0 as? Operator {
                        sut.enqueue(value)
                    }
                    
                    if let value = $0 as? Double {
                        operands.enqueue(value)
                    }
                }
            
            let add = sut[0]?.calculate(lhs: operands[0]!, rhs: operands[1]!)
            let result = sut[1]?.calculate(lhs: add!, rhs: operands[2]!)
            
            // then
            XCTAssertEqual(result, expectation)
        } catch {}
    }
}
