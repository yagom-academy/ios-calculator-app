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
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result_가_OperatorCacluater_를반환하는지() {
        //given
        let array: [String] = ["4.0", "+", "1.0", "-", "3", "*", "3", "/", "3"]
        let output = 2.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        array.compactMap {Double($0)}
            .forEach {
                operandsQueue.enqueue($0)
            }
        
        array.filter { value in
            return Double(value) == nil
        }.forEach { oper in
            let opert = Character(oper)
            operatorQueue.enqueue(Operator(rawValue: opert)!)
        }
        
        //when
        sut = Formula(operands: operandsQueue, operators: operatorQueue)
        
        //then
        XCTAssertEqual(try sut.result(), output)
    }
    
    func test_result_가_OperatorCacluater_nan_를반환하는지() {
        //given
        let array: [String] = ["4.0", "*", "1", "/", "0", "+", "10"]
        let output: Double = .nan
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        array.compactMap {Double($0)}
            .forEach {
                operandsQueue.enqueue($0)
            }
        
        array.filter { value in
            return Double(value) == nil
        }.forEach { oper in
            let opert = Character(oper)
            operatorQueue.enqueue(Operator(rawValue: opert)!)
        }
        
        //when
        sut = Formula(operands: operandsQueue, operators: operatorQueue)
        //then
        XCTAssertEqual(try sut.result(), output)
    }
}
