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

    func test_리스트_초기의_isEmpty값이_true여야한다() {
        //given
        let sut = Linkedlist<Int>()
        //when,then
        XCTAssertTrue(sut.isEmpty)
    }

}
