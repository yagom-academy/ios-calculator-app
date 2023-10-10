//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hisop on 2023/10/05.
//

import XCTest
@testable import Calculator

extension Int: CalculateItem { }

final class CalculatorTests: XCTestCase {
    var sut: CalculateItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //peek
    func test_enqueue로_1을_넣고_peek을_호출시_반환값이_1인지() {
        //given
        let expectation = 1

        sut.enqueue(value: 1)

        //when
        let result = sut.peek()

        //then
        XCTAssertEqual(result, expectation)
    }

    //dequeue
    func test_enqueue로_1을_넣고_dequeue를_호출시_반환값이_1인지() {
        //given
        let expectation = 1
        
        sut.enqueue(value: 1)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    //dequeue - 제거
    func test_enqueue로_1을_넣고_dequeue를_호출시_리스트가_비어있는지() {
        //given
        sut.enqueue(value: 1)
        
        //when
        sut.dequeue()
        let result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result)
    }
    
    //dequeue - 실패케이스
    func test_빈_큐에_dequeue를_호출시_nil을_반환하는지() {
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    
    func test_큐가_비어있을경우_isEmpty실행시_반환값이_True인지() {
        //when
        let result = sut.isEmpty()

        //then
        XCTAssertTrue(result)
    }
    
    func test_enqueue로_1_2_3을_넣고_clear실행시_Queue가_비어있는지() {
        //given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        //when
        sut.clear()
        
        //then
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue로_1_2_3을_넣고_count실행시_3이_반환되는지() {
        let expectation = 3
        
        //given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        //when
        let result = sut.count()
        
        //then
        XCTAssertEqual(result, expectation)
    }
}
