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

    override func setUpWithError() throws {
        try super.setUpWithError()
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    
    func test_2_5_더했을때_7인지_확인() {
        //given
        sut.operands.enqueue(item: 2.0)
        sut.operands.enqueue(item: 5.0)
        sut.operators.enqueue(item: .add)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 7)
    }
    
    func test_5_2_빼기했을때_3인지_확인() {
        //given
        sut.operands.enqueue(item: 5.0)
        sut.operands.enqueue(item: 2.0)
        sut.operators.enqueue(item: .subtract)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_4_2_나누기했을때_2인지_확인() {
        //given
        sut.operands.enqueue(item: 4.0)
        sut.operands.enqueue(item: 2.0)
        sut.operators.enqueue(item: .divide)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_2_5_곱했을때_10인지_확인() {
        //given
        sut.operands.enqueue(item: 2.0)
        sut.operands.enqueue(item: 5.0)
        sut.operators.enqueue(item: .multiply)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 10)
    }
    
    func test_2_5_3더했을때_10인지_확인() {
        //given
        sut.operands.enqueue(item: 2.0)
        sut.operands.enqueue(item: 5.0)
        sut.operands.enqueue(item: 3.0)
        sut.operators.enqueue(item: .add)
        sut.operators.enqueue(item: .add)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 10)
    }
    
    func test_음수2_음수5_더했을때_음수7인지_확인() {
        //given
        sut.operands.enqueue(item: -2.0)
        sut.operands.enqueue(item: -5.0)
        sut.operators.enqueue(item: .subtract)
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 3)
    }
}
