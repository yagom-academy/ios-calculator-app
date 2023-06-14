//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jusbug, Yetti on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를_호출하여_1과2와3을_넣고_개수가3개면_True를_반환하는지() {
        // given
        let expectation = 3
        
        // when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_dequeue를_호출하여_3과4와5에서_3을_제거할때_개수가_2개인지() {
        // given
        sut.enqueue("3")
        sut.enqueue("4")
        sut.enqueue("5")
        
        // when
        XCTAssertEqual(sut.dequeue(), "3")
        
        // then
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_clear를_호출하어_빈배열이되면_True를_반환하는지() {
        // given
        sut.enqueue("8")
        sut.enqueue("x")
        sut.enqueue("9")
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
