//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by DuDu on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - isEmpty 함수 테스트
    func test_큐가_비어있을때_isEmpty가_true인지() {
        //given, when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    //MARK: - enqueue 함수 테스트
    func test_큐에_1_2_3을_넣었을때_큐가_1_2_3을_가지고있는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.allElement()
        
        //then
        XCTAssertEqual(result, [1,2,3])
    }
    
    //MARK: - dequeue 함수 테스트
    func test_큐에_1_2_3을_넣고_dequeue했을때_큐가_2_3을_가지고있는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        _ = sut.dequeue()
        
        //when
        let result = sut.allElement()
        
        //then
        XCTAssertEqual(result, [2,3])
    }
    
    func test_빈큐에_dequeue했을때_nil을_반환하는지() {
        //given, when, then
        XCTAssertNil(sut.dequeue())
    }
    
    //MARK: - removeAll 테스트
    func test_1_2_3을_enqueue한다음_removeAll했을때_isEmpty가_true인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
