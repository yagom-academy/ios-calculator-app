//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by DuDu on 2022/03/16.
//

import XCTest
@testable import Calculator

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>?

    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_초기화후_isEmpty가_true여야한다() {
        //given
        let sut = LinkedList<Int>()
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_초기화후_1을넣었을때_head와_tail의_데이터가_모두_1이여야한다() {
        //given
        var sut = LinkedList<Int>()
        sut.append(1)
        
        //when
        let headData = sut.head?.data
        let tailData = sut.tail?.data
        
        XCTAssertEqual(1, headData)
        XCTAssertEqual(headData, tailData)
    }
}
