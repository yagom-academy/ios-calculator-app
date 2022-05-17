//
//  LikedListTest.swift
//  LikedListTest
//
//  Created by Kiwi on 2022/05/17.
//

import XCTest
@testable import Calculator
class LinkedListTest: XCTestCase {
    var sut: Linkedlist<Int>?
    
    override func setUpWithError() throws {
        sut = Linkedlist<Int>()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func test_리스트_초기화_후_isEmpty값이_true여야한다() {
        //given
        let sut = Linkedlist<Int>()
        //when,then
        XCTAssertTrue(sut.isEmpty)
    }
   
    func test_정수를_넣었을때_head의_값이_1이여야한다() {
        //given
        sut?.append(data: 1)
        //when
        let head = sut?.head?.data
        //then
        XCTAssertEqual(1, head)
    }
    
    func test_1과2를_넣었을때_리스트의_마지막_값이_2여야한다() {
        //given
        sut?.append(data: 1)
        sut?.append(data: 2)
        //when
        let lastData = sut?.head?.next?.data
        //then
        XCTAssertEqual(lastData, 2)
    }
    
    func test_1을_입력_후_removeFirst를_하면_1이_나와야한다() {
            //given
            sut?.append(data: 1)
            //when
            let firstElement = sut?.removeFirst()
            //then
            XCTAssertEqual(firstElement, 1)
        }
        
        func test_리스트_초기화_후_removeFirst를_하면_nil이_나와야한다() {
            XCTAssertNil(sut?.removeFirst())
        }
}
