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
    
    func test_changeNext_with_no_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        sut.changeNext(newNode)
        XCTAssertIdentical(newNode, sut.next)
    }
    
    func test_changePrevious_with_no_error() {
        let value: Int = 5
        let newNode = CalculatorItemNode(value)
        sut.changePrevious(newNode)
        XCTAssertIdentical(newNode, sut.previous)
    }
    
}
