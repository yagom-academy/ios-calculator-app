//
//  FormulaTest.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    private var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(),
                      operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - result 메서드 테스트
    func test_operand의head만있을때_result가head의value값으로반환이되는지() {
        // given
        sut.operands.enqueue(3)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_operand와operator가head만있을때_result가head의value값으로반환이되는지() {
        // given
        sut.operands.enqueue(7)
        sut.operators.enqueue(.subtract)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, 7)
    }
    
    func test_operand가2개_operator가1개있을때_result값이잘반환되는지() {
        // given
        sut.operands.enqueue(3)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(5)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, -2)
    }
    
    func test_operand가3개_operator가1개있을때_result값이잘반환되는지() {
        // given
        sut.operands.enqueue(10)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(3)
        sut.operands.enqueue(2)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, 7)
    }
    
    func test_operand가3개_operator가2개있을때_result값이잘반환되는지() {
        // given
        sut.operands.enqueue(10)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(2)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, 14)
    }
    
    func test_operand가6개_operator가5개있을때_result값이잘반환되는지() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue(.add)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(6)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertEqual(result, -0.5)
    }
    
    func test_0으로나누기를시도할때_오류가발생하는지() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(0)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_정상적인연산후에_0으로나누기를시도할때_오류가발생하는지() {
        // given
        sut.operands.enqueue(3)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(1)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(0)
        
        // when
        let result: Double? = try? sut.result()
        
        // then
        XCTAssertNil(result)
    }
}
