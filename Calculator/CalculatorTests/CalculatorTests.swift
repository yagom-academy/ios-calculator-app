//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Seoyeon Hong on 2023/01/26.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_head접근시_첫번째노드를반환한다() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let expectation = 1
        let result = sut.head?.data
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_last접근할때_마지막노드를_반환한다() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let expectation = 2
        let result = sut.last?.data
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_isEmpty접근할때_요소가_있으면_Bool을반환한다() {
        sut.enqueue(1)
        
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_isEmpty접근할때_요소가_없으면_true를반환한다() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue실행시_입력된_값이_첫번째노드_값으로_생성이된다() {
        let input = 1
        let expectation = 1
        
        sut.enqueue(input)
        
        XCTAssertEqual(input, expectation)
    }
    
    func test_enqueue실행시_첫번째값_뒤에_두번째노드가_생성이된다() {
        let expectation = 3
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let result = sut.last?.data
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue실행시_값이없으면_nil이_반환된다() {
        let result = sut.dequeue()
        XCTAssertEqual(nil, result)
    }
    
    func test_dequeue실행시_첫번째값이_삭제된다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let expectation = 1
        let result = sut.dequeue()
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue실행후_헤드값이_다음노드로_변경된다() {
        let expectation = 2
        
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.dequeue()
        
        let result = sut.head?.data
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_removeAll실행시_모든값이_비워진다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        sut.removeAll()
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_removeAll실행시_값이_없으면_종료된다() {
        sut.removeAll()
        
        XCTAssert(sut.isEmpty)
    }

}
