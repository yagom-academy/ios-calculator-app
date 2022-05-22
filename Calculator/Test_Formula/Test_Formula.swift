//
//  Test_Formula.swift
//  Test_Formula
//
//  Created by 허건 on 2022/05/22.
//

import XCTest
@testable import Calculator

class Test_Formula: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_가_add_를반환하는지() {
        //ginven
        let output = 30.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()

        operandsQueue.enqueue(10)
        operandsQueue.enqueue(20)
        
        //when
        operatorQueue.enqueue(Operator.add)
        sut = Formula(operands: operandsQueue, operators: operatorQueue)

        let result = sut.result()
        //then
        XCTAssertEqual(result, output)
    }
    
    func test_result_가_subtract_를반환하는지() {
        //ginven
        let output = -10.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()

        operandsQueue.enqueue(20)
        operandsQueue.enqueue(10)
        
        //when
        operatorQueue.enqueue(Operator.subtract)
        sut = Formula(operands: operandsQueue, operators: operatorQueue)

        let result = sut.result()
        //then
        XCTAssertEqual(result, output)
    }
    
    func test_result_가_divide_를반환하는지() {
        //ginven
        let output = 2.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()

        operandsQueue.enqueue(10)
        operandsQueue.enqueue(20)
        
        //when
        operatorQueue.enqueue(Operator.divide)
        sut = Formula(operands: operandsQueue, operators: operatorQueue)

        let result = sut.result()
        //then
        XCTAssertEqual(result, output)
    }
    
    func test_result_가_multiply_를반환하는지() {
        //ginven
        let output = 200.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()

        operandsQueue.enqueue(20)
        operandsQueue.enqueue(10)
        
        //when
        operatorQueue.enqueue(Operator.multiply)
        sut = Formula(operands: operandsQueue, operators: operatorQueue)

        let result = sut.result()
        //then
        XCTAssertEqual(result, output)
    }
}
