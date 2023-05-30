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
        sut.enqueue(input)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_dequeue함수호출시_배열의첫번째원소가_사라지는지() {
        // given
        sut.calculatorItemQueue = [2, 3, 4]
        let expectation = [3, 4]
        // when
        sut.dequeue()
        // then
        XCTAssertEqual(sut.calculatorItemQueue, expectation)
    }
    
}
