//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hisop on 2023/10/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculateItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue로_1_2_3을_넣었을때_head가1인지() {
        let expectation = 1

        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)

        let result = sut.peek()

        XCTAssertEqual(result as? Int, expectation)
    }

    func test_enqueue로_1_2_3을_넣고_dequeue실행시_head가2인지() {
        let expectation = 2
        
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        let _ = sut.dequeue()
        let result = sut.peek()
        
        XCTAssertEqual(result as? Int, expectation)
    }
    
    func test_isEmpty실행시_리스트가_비어있을경우_True가_반환되는지() {
        let result = sut.isEmpty()

        XCTAssertTrue(result)
    }
    
    func test_enqueue로_1_2_3을_넣고_clear실행시_Queue가_비어있는지() {
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        sut.clear()
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue로_1_2_3을_넣고_count실행시_3이_반환되는지() {
        let expectation = 3
        
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        let result = sut.count()
        XCTAssertEqual(result, expectation)
    }
}
