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
        
        let doubleList = LinkedList(head: Node(data: CalculatorItem.double(1)))
        let operatorList = LinkedList(head: Node(data: CalculatorItem.operator(.add)))
        let doubleQueue = CalculatorItemQueue(linkedList: doubleList)
        let operatorQueue = CalculatorItemQueue(linkedList: operatorList)
        
        sut = Formula(operands: doubleQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result_Double반환하는지() {
        let expectation = 1.0
        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
}
