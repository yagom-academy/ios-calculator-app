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
    typealias DoubleNode = LinkedList<Double>.Node
    typealias OperatorList = LinkedList<Operator>
    typealias OperatorNode = LinkedList<Operator>.Node
    
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
        let node = OperatorNode(data: .add)
        let operatorList = OperatorList(head: node, tail: node)
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 0.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operators에값이없고_operands에값1이있을때_1을반환한다() {
        // given
        let node = DoubleNode(data: 1.0)
        let doubleList = DoubleList(head: node, tail: node)
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
        let firstNode = DoubleNode(data: 2.0)
        let secondNode = DoubleNode(data: 3.0)
        let doubleList = DoubleList(head: firstNode, tail: secondNode)
        firstNode.setNext(secondNode)
        
        let addNode = OperatorNode(data: .add)
        let subtractNode = OperatorNode(data: .subtract)
        let operatorList = OperatorList(head: addNode, tail: subtractNode)
        addNode.setNext(subtractNode)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 5.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operans에2와3과4값이있고_operator에add와subtract일때_1을반환한다() {
        // given
        let firstNode = DoubleNode(data: 2.0)
        let secondNode = DoubleNode(data: 3.0)
        let thirdNode = DoubleNode(data: 4.0)
        let doubleList = DoubleList(head: firstNode, tail: thirdNode)
        firstNode.setNext(secondNode)
        secondNode.setNext(thirdNode)
        
        let addNode = OperatorNode(data: .add)
        let subtractNode = OperatorNode(data: .subtract)
        let operatorList = OperatorList(head: addNode, tail: subtractNode)
        addNode.setNext(subtractNode)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_operans에2와2와4값이있고_operator에divide와mutiply일때_4를반환한다() {
        // given
        let firstNode = DoubleNode(data: 2.0)
        let secondNode = DoubleNode(data: 2.0)
        let thirdNode = DoubleNode(data: 4.0)
        let doubleList = DoubleList(head: firstNode, tail: thirdNode)
        firstNode.setNext(secondNode)
        secondNode.setNext(thirdNode)
        
        let addNode = OperatorNode(data: .divide)
        let subtractNode = OperatorNode(data: .multiply)
        let operatorList = OperatorList(head: addNode, tail: subtractNode)
        addNode.setNext(subtractNode)
        
        sut = Formula(operands: .init(list: doubleList), operators: .init(list: operatorList))
        let expectation = 4.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
