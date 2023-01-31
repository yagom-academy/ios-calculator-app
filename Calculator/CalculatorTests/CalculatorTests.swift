//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Seoyeon Hong on 2023/01/26.
//

import XCTest

final class CalculatorTests: XCTestCase {
    
    var sut = CalculatorItemQueue<Int>()
    
    func test_enqueue실행시_처음_값을_넣어주면_처음넣은값이_출력된다() {
        //given when
        sut.enqueue(1)
        let expectation = sut.peek
        
        //then
        XCTAssertEqual(1, expectation)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue실행시_처음_값을_넣어주면_처음넣은값이_출력된다() {
        //given
        let fisrt = sut.peek

        //when
        sut.enqueue(1)
        
        //then
        XCTAssertEqual(fisrt, 1)
    }
    
    func test_enqueue실행시_값을_여러번_넣었을때_첫번째값이_출력된다() {
        //given
        let fisrt = sut.peek
        
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        let expectation = sut.peek
        
        //then
        XCTAssertEqual(fisrt, 1)
    }
    
    func test_dequeue실행시_첫번째로넣어줬던값이_삭제된다() {
        //given
        let item = sut.dequeue()
        
        //when
        sut.enqueue(1)
        
        //then
        XCTAssertEqual(item, 1)
    }
    
    func test_값을_여러번넣고_dequeue실행시_첫번째로넣었던값이_삭제되고_두번째가남는다() {
        //given
        let first = sut.peek
        
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        
        //then
        XCTAssertEqual(first, 2)
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
