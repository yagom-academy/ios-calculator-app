//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박종화 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
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
        let expectation = 3
        
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_dequeue를_호출하여_3과4와5에서_3을_제거할때_개수가_2개인지() {
        sut.enqueue("3")
        sut.enqueue("4")
        sut.enqueue("5")
        
        XCTAssertEqual(sut.dequeue(), "3")
        
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_clear를_호출하어_빈배열이되면_True를_반환하는지() {
        sut.enqueue("8")
        sut.enqueue("x")
        sut.enqueue("9")
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty)
        
    }
}
