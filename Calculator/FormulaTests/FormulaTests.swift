//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by jyubong,Morgan.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    typealias DoubleList = LinkedList<Double>
    typealias OperatorList = LinkedList<Operator>
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result호출시_operands에값이없을때_0을반환한다() {
        // given
        let doubleList = DoubleList()
        let data = Operator.add
        let operatorList = OperatorList(head: .init(data: data), tail: .init(data: data))
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 0.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operators에값이없고_operands에값1이있을때_1을반환한다() {
        // given
        let data = 1.0
        let doubleList = DoubleList(head: .init(data: data), tail: .init(data: data))
        let operatorList = OperatorList()
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operans에2와3값이있고_operator에add와subtract일때_5를반환한다() {
        // given
        let firstData = 2.0
        let secondData = 3.0
        let doubleList = DoubleList(head: .init(data: firstData), tail: .init(data: secondData))
        doubleList.head?.setNext(doubleList.tail)
        
        let addData = Operator.add
        let subtractData = Operator.subtract
        let operatorList = OperatorList(head: .init(data: addData), tail: .init(data: subtractData))
        operatorList.head?.setNext(operatorList.tail)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 5.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operans에2와3과4값이있고_operator에add와subtract일때_1을반환한다() {
        // given
        let firstData = 2.0
        let secondData = 3.0
        let thirdData = 4.0
        let doubleList = DoubleList(head: .init(data: firstData), tail: .init(data: thirdData))
        doubleList.head?.setNext(LinkedList.Node(data: secondData))
        doubleList.head?.next?.setNext(doubleList.tail)
        
        let addData = Operator.add
        let subtractData = Operator.subtract
        let operatorList = OperatorList(head: .init(data: addData), tail: .init(data: subtractData))
        operatorList.head?.setNext(operatorList.tail)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operans에2와2와4값이있고_operator에divide와mutiply일때_4를반환한다() {
        // given
        let firstData = 2.0
        let secondData = 2.0
        let thirdData = 4.0
        let doubleList = DoubleList(head: .init(data: firstData), tail: .init(data: thirdData))
        doubleList.head?.setNext(LinkedList.Node(data: secondData))
        doubleList.head?.next?.setNext(doubleList.tail)
        
        let divideData = Operator.divide
        let multiplyData = Operator.multiply
        let operatorList = OperatorList(head: .init(data: divideData), tail: .init(data: multiplyData))
        operatorList.head?.setNext(operatorList.tail)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 4.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
