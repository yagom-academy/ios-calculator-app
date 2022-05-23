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
        let array: [String] = ["10.0", "-", "10.0", "+", "5"]
        let output = 5.0
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        let numberArray = array.compactMap { value in
            if let element = Double(value) {
                operandsQueue.enqueue(element)
            }
        }

        let operArray = array.filter { value in
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
