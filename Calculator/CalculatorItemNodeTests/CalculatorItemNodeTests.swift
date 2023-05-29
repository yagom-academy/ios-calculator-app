//
//  CalculatorItemNodeTests.swift
//  CalculatorItemNodeTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemNodeTests: XCTestCase {
    var sut: CalculatorItemNode!

    override func setUpWithError() throws {
        let value: Int = 7
        sut = CalculatorItemNode(value)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_addNext_with_no_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        try? sut.addNext(newNode)
        XCTAssertIdentical(newNode, sut.next)
    }
    
    func test_addNext_with_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        sut.next = newNode
        XCTAssertThrowsError(try sut.addNext(newNode)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.itemAlreadyExist)
        }
    }
    
    func test_addPrevious_with_no_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        try? sut.addPrevious(newNode)
        XCTAssertIdentical(newNode, sut.previous)
    }
    
    func test_addPrevious_with_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        sut.previous = newNode
        XCTAssertThrowsError(try sut.addPrevious(newNode)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.itemAlreadyExist)
        }
    }
    
    func test_removeNext() {
        let next = sut.next
        sut.removeNext()
        XCTAssertNil(sut.next)
    }
}
