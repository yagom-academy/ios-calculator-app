//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/05/31.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue함수호출시_queue의원소개수가_늘어나는지() {
        // given
        let expectation: Int = 3
        // when
        sut.enqueue(3.25)
        sut.enqueue(4)
        sut.enqueue(5)
        // then
        XCTAssertEqual(sut.count, expectation)
    }

    func test_enqueue함수호출시_queue의_마지막원소로_삽입되는지() {
        // given
        let expectation: Double = 3
        // when
        sut.enqueue(2)
        sut.enqueue(3)
        // then
        XCTAssertEqual(sut.readLastData(), expectation)
    }
    
    func test_dequeue함수호출시_queue의원소의개수가_줄어드는지() {
        // given
        let expectation: Int = 2
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        // when
        sut.dequeue()
        // then
        XCTAssertEqual(sut.count, expectation)
    }

    func test_dequeue함수호출시_queue의첫번째원소가_사라지는지() {
        // given
        let expectation: Double = 3
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        // when
        sut.dequeue()
        // then
        XCTAssertEqual(sut.readFirstData(), expectation)
    }

    func test_clearQueue함수호출시_queue의isEmpty가_true가되는지() {
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
