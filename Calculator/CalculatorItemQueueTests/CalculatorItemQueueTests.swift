//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김인호 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_enqueue실행시_큐가비어있으면_입력값이_첫번째노드로_생성되는가() {
        //given
        let input = 3
        
        //when
        sut.enqueue(element: input)
        
        //then
        XCTAssertEqual(input, sut.head?.data)
    }
    
    func test_enqueue실행시_마지막노드_뒤에_입력한노드가_추가되는가() {
        //given
        let input = 3
        
        //when
        sut.enqueue(element: 4)
        sut.enqueue(element: 6)
        sut.enqueue(element: input)
        
        //then
        XCTAssertEqual(input, sut.last?.data)
    }
    
    func test_dequeue실행시_큐가비어있으면_nil이_반환되는가() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(nil, result)
    }
    
    func test_dequeue실행시_큐의_첫번째데이터가_반환되는가() {
        //given
        sut.enqueue(element: 3)
        sut.enqueue(element: 7)
        sut.enqueue(element: 4)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(3, result)
    }
    
    func test_dequeue실행시_큐의_헤드가_다음노드로_이동하는가() {
        //given
        sut.enqueue(element: 3)
        sut.enqueue(element: 7)
        sut.enqueue(element: 4)
        
        //when
        sut.dequeue()
        let result = sut.head?.data
        
        //then
        XCTAssertEqual(7, result)
    }
    
    func test_removeAll실행시_큐가_비워지는지() {
        //given
        sut.enqueue(element: 3)
        sut.enqueue(element: 7)
        sut.enqueue(element: 4)
        
        //when
        sut.removeAll()
        
        //then
        XCTAssert(sut.isEmpty)
    }
    
    func test_removeAll실행시_큐에요소가없다면_종료되는지() {
        //given
        
        //when
        sut.removeAll()
        
        //then
        XCTAssert(sut.isEmpty)
    }
    
    func test_last프로퍼티접근시_큐에요소가없다면_nil이반환되는지() {
        //given
        
        //when
        let result = sut.last
        
        //then
        XCTAssertNil(result)
    }
    
    func test_last프로퍼티접근시_큐의마지막요소를반환하는지() {
        //given
        sut.enqueue(element: 4)
        sut.enqueue(element: 5)
        sut.enqueue(element: 6)
        
        //when
        let firstResult = sut.last?.data
        sut.enqueue(element: 7)
        let secondResult = sut.last?.data
        
        //then
        XCTAssertNotEqual(firstResult, secondResult)
    }
    
    func test_isEmpty프로퍼티접근시_큐에요소가없다면_True를반환하는가() {
        //given

        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty프로퍼티접근시_큐에요소가있다면_False를반환하는가() {
        //given
        sut.enqueue(element: 8)
        sut.enqueue(element: 9)

        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
}
