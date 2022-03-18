//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김태현 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    private var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let doubleList = LinkedList(head: Node(data: 1.0))
        doubleList.append(node: Node(data: 2.0))
        let operatorList = LinkedList(head: Node(data: Operator.add))
        let operandsQueue = CalculatorItemQueue(linkedList: doubleList)
        let operatorQueue = CalculatorItemQueue(linkedList: operatorList)
        
        sut = Formula(operands: operandsQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result_Double반환하는지() throws {
        let expectation = 3.0
        let result = try sut.result()
        
        XCTAssertEqual(result, expectation)
    }
}
