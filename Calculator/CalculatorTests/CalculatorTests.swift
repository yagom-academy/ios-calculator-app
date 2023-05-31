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
    
    func test_enqueue를_호출하여_1과2와3을_넣었을때_개수가_3이_나오는지() {
        sut.enqueue("1")
        sut.enqueue("-")
        sut.enqueue("2")
        
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_dequeue를_호출하여_1과2와3에서_3을_제거할때_개수가_2개인지() {
        sut.enqueue("3")
        sut.enqueue("+")
        sut.enqueue("4")
        
        XCTAssertEqual(sut.dequeue(), "3")
        
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_clear이_호출되면_빈배열이_반환되는지() {
        sut.enqueue("8")
        sut.enqueue("x")
        sut.enqueue("9")
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty)
        
    }
}
