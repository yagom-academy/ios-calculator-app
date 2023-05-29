//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_appendQueue() {
        // given
        let item: Int = 3
        let newNode = CalculatorItemNode(item)
        
        // when
        sut.appendQueue(newNode)
        let result = sut.tail
        
        // then
        XCTAssertIdentical(result, newNode)
    }
    
    func test_removeLastQueue_without_error() {
        // given
        var lastItem = sut.tail
        
        if lastItem == nil {
            sut.appendQueue(CalculatorItemNode(3))
            sut.appendQueue(CalculatorItemNode(5))
            lastItem = sut.tail
        }
        
        // when
        try? sut.removeLastQueue()
        let result = sut.tail
        
        // then
        XCTAssertNotIdentical(result, lastItem)
    }
    
    func test_removeLastQueue_with_error() {
        XCTAssertThrowsError(try sut.removeLastQueue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.itemNotFound)
        }
    }
    
    func test_popQueue() {
        var headBeforePop = sut.head
        if headBeforePop == nil {
            let item: Int = 3
            let newNode = CalculatorItemNode(item)
            sut.appendQueue(newNode)
            headBeforePop = sut.head
        }
        let result = try? sut.popQueue()
        let headAfterPop = sut.head
        XCTAssertIdentical(headBeforePop, result)
        XCTAssertNotIdentical(headBeforePop, headAfterPop)
    }
    
    func test_popQueue_with_error() {
        XCTAssertThrowsError(try sut.popQueue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.itemNotFound)
        }
    }
}

