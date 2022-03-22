//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 최최성균 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    //MARK: - result()
    func test_rsult호출시_숫자가입력되지않았을경우_0을반환하는지() {
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_rsult호출시_숫자하나만입력되었을경우_해당숫자를반환하는지() {
        //given
        let input = 4.3
        //when
        sut.operands.enqueue(input)
        let result = sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_rsult호출시_숫자하나와연산자하나만입력되었을경우_해당숫자를반환하는지() {
        //given
        let inputNum = 3.4
        let inputOperation = Operator.multiply
        //when
        sut.operands.enqueue(inputNum)
        sut.operations.enqueue(inputOperation)
        let result = sut.result()
        //then
        XCTAssertEqual(result, inputNum)
    }
    func test_result호출시_연산자만있을경우_0을반환하는지() {
        //given
        let inputOperation = Operator.divide
        //when
        sut.operations.enqueue(inputOperation)
        let result = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_result호출시_숫자하나와연산자만2개있을경우_해당숫자를반환하는지() {
        //given
        let inputNumber = 3.0
        let inputOperation = Operator.divide
        let inputOperation2 = Operator.subtract
        //when
        sut.operands.enqueue(inputNumber)
        sut.operations.enqueue(inputOperation)
        sut.operations.enqueue(inputOperation2)
        let result = sut.result()
        //then
        XCTAssertEqual(result, inputNumber)
    }
    
    func test_result호출시_6나누기3빼기6곱하기4진행시_음수16을반환하는지() {
        //when
        sut.operands.enqueue(6)
        sut.operands.enqueue(3)
        sut.operations.enqueue(.divide)
        sut.operands.enqueue(6)
        sut.operations.enqueue(.subtract)
        sut.operands.enqueue(4)
        sut.operations.enqueue(.multiply)
        let result = sut.result()
        //then
        XCTAssertEqual(result, -16)
    }
    
    func test_result호출시_0으로나눌경우_nan을반환하는지() {
        //when
        sut.operands.enqueue(6)
        sut.operations.enqueue(.divide)
        sut.operands.enqueue(3)
        sut.operations.enqueue(.divide)
        sut.operands.enqueue(0)
        sut.operations.enqueue(.multiply)
        sut.operands.enqueue(4)
        let result = sut.result()
        //then
        XCTAssertTrue(result.isNaN)
    }
}
