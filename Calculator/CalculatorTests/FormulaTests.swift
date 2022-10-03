//  FormulaTests.swift
//  Created by zhilly on 2022/09/26.

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(),
                      operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operandsQueue에10_20_30_40_50이들어있고_operatorQueue에_빼기더하기곱하기나누기가순서대로들어있을때_16이나오는지() {
        //given
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(20.0)
        sut.operands.enqueue(30.0)
        sut.operands.enqueue(40.0)
        sut.operands.enqueue(50.0)
        
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 16)
    }
    
    func test_operandsQueue에10_20_30_40_50이들어있고_operatorQueue에_곱하기곱하기곱하기곱하기가들어있을때_12000000이나오는지() {
        //given
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(20.0)
        sut.operands.enqueue(30.0)
        sut.operands.enqueue(40.0)
        sut.operands.enqueue(50.0)
        
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 12000000)
    }
    
    func test_operands가비어있을때_0이제대로반환되는지() {
        //given
        sut.operators.enqueue(Operator.add)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 0.0)
    }
    
    func test_100을0으로나눗셈을진행하면_NaN을반환하는지() {
        //given
        sut.operands.enqueue(100.0)
        sut.operands.enqueue(0.0)
        
        sut.operators.enqueue(Operator.divide)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_operands의개수가더부족하면_NaN을반환하는지() {
        //given
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(20.0)
        sut.operands.enqueue(30.0)
        
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        
        //when
        let result = sut.result()

        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_operator의개수가2개이상부족하면_NaN을반환하는지() {
        //given
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(20.0)
        sut.operands.enqueue(30.0)
        sut.operands.enqueue(40.0)

        
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        
        //when
        let result = sut.result()

        //then
        XCTAssertTrue(result.isNaN)
    }
}
