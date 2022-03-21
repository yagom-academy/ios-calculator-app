//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by DuDu on 2022/03/16.
//

import XCTest
@testable import Calculator

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Double>?

    override func setUpWithError() throws {
        sut = LinkedList<Double>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_초기화후_isEmpty가_true여야한다() {
        //given
        let sut = LinkedList<Double>()
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_초기화후_데이터를_넣으면_head와_tail_모두_해당데이터를_가지고있어야한다() {
        //given
        sut?.append(1)
        
        //when
        let headData = sut?.head?.data
        let tailData = sut?.tail?.data
        
        //then
        XCTAssertEqual(1, headData)
        XCTAssertEqual(headData, tailData)
    }
    
    func test_데이터를_여러개_추가했을때_head는_가장먼저넣은데이터_tail은_가장나중에넣은데이터를_가지고있어야한다() {
        //given
        sut?.append(1)
        sut?.append(2)
        sut?.append(3)
        
        //when
        let headData = sut?.head?.data
        let tailData = sut?.tail?.data
        
        //then
        XCTAssertEqual(1, headData)
        XCTAssertEqual(3, tailData)
    }
    
    func test_초기화후_removeFirst를_했을때_nil이_나와야한다() {
        XCTAssertNil(sut?.removeFirst())
    }
}
