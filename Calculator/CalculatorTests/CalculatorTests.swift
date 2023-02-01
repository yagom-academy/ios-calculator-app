//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Seoyeon Hong on 2023/01/26.
//

import XCTest

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>! = CalculatorItemQueue<Int>()
    
    func test_enqueue실행시_처음_값을_넣어주면_처음넣은값이_출력된다() {
        //given when
        sut.enqueue(1)
        let expectation = sut.peek
        
        //then
        XCTAssertEqual(1, expectation)
    }
    
    func test_enqueue실행시_값을_여러번_넣었을때_첫번째값이_출력된다() {
        //given when
        sut.enqueue(1)
        sut.enqueue(2)
        let expectation = sut.peek
        
        //then
        XCTAssertEqual(1, expectation)
    }
    
    func test_dequeue실행시_첫번째로넣어줬던값이_삭제된다() {
        //given when
        sut.enqueue(1)
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_값을_여러번넣고_dequeue실행시_첫번째로넣었던값이_삭제되고_두번째가남는다() {
        //given when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        let expectation = sut.peek
        
        //then
        XCTAssertEqual(2, expectation)
    }
    
    func test_putValueAndRemove_Check_ResultIsEmpty() {
        //when
        sut.enqueue(1)
        sut.dequeue()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_putValueAnd_Check_Result_IsNotEmpty() {
        //when
        sut.enqueue(1)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
}
