//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/5/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    var formulaSut: Formula!
    
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        formulaSut = nil
    }

    func test_큐_요소개수파악이되는지테스트() throws {
        sut.enqueue("3")
        let expection = 1
        
        let result = sut.count
        
        XCTAssertEqual(expection, result)
    }
    
    func test_큐_비어있는상태인지테스트() {
        sut.enqueue("2")
        sut.enqueue("4")
        let expection = false
        
        let result: Bool = sut.isEmpty
        
        XCTAssertEqual(expection, result)
    }

    func test_큐_요소추가하기() {
        sut.enqueue("2")
        let expectation: [String] = ["2"]
        
        let result = sut.showQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_요소제거하기_FirstOut() {
        sut.enqueue("2")
        sut.enqueue("+")
        sut.enqueue("3")
        let expectation = "+"
        sut.dequeue()
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_Formula_연산결과확인하기() {
        operands.enqueue(1.0)
        operands.enqueue(1.0)
        operands.enqueue(2.0)
        operators.enqueue(Operator.add)
        operators.enqueue(Operator.multiply)
        let expression = 4.0
        
        formulaSut = Formula(operands: operands, operators: operators)
        let result = formulaSut.result()
        
        XCTAssertEqual(result, expression)
    }
    
}
