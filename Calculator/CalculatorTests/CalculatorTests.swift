//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append() {
        let item: Int = 3
        let newNode = CalculatorItemNode(item)
        sut.append(newNode)
        let result = sut.tail
        XCTAssertIdentical(result, newNode)
    }
    
    func test_removeLast() {
        let lastItem = sut.tail
        sut.removeLast()
        let result = sut.tail
        if result != nil {
            XCTAssertNotIdentical(result, lastItem)
        }
    }
}
