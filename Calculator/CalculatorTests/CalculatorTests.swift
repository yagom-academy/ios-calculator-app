//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by mint on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue2번시_count가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_first_enqueue_1과2로했을때_first가_1인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.first
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_first_enqueue_1과2와3실행하고_dequeue1번시_first가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let answer = sut.dequeue()
        
        //when
        let result = sut.first
        
        //then
        XCTAssertEqual(result, 2)
        XCTAssertEqual(answer, 1)
    }
    
    func test_last_enqueue_1과2실행시_last가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.last
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_dequeue_enqueue1과2실행시_dequeue1번결과가_1인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue_내용이없을때_nil반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_enqueue3번후_dequeue1번시_count가_2로나오는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let answer = sut.dequeue()
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
        XCTAssertEqual(answer, 1)
    }
    
    func test_enqueue2번하고_dequeue하고_다시endqueue할때() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        let result = sut.dequeue()

        //when
        sut.enqueue(30)
        let count = sut.count
        let result2 = sut.dequeue()
        let result3 = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 10)
        XCTAssertEqual(result2, 20)
        XCTAssertEqual(result3, 30)
        XCTAssertEqual(count, 2)
    }
}
