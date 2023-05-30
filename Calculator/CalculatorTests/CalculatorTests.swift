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
    
    func test_enqueue함수호출시_배열의원소가_늘어나는지() {
        // given
        sut.enqueue(2)
        let input = 3
        let expectation = [2, 3]
        // when
        sut.enqueue(input)
        // then
        XCTAssertEqual(sut.readCalculatorItemQueue(), expectation)
    }
    
    func test_dequeue함수호출시_배열의첫번째원소가_사라지는지() {
        // given
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        let expectation = [3, 4]
        // when
        sut.dequeue()
        // then
        XCTAssertEqual(sut.readCalculatorItemQueue(), expectation)
    }
    
    func test_clearQueue함수호출시_배열의원소가_다삭제되면_true를_반환한다() {
        // given
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        // when
        sut.clearQueue()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
