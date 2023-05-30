//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/05/31.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue함수호출시_배열의원소개수가_늘어나는지() {
        // given
        let input = 3
        let expectation = 1
        // when
        let result = sut.enqueue(input)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
}
