//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK:- append() tests
    func test_빈리스트에서append호출시_4를전달하면_headvalue에4가할당되는지() {
        //given
        //when
        sut.append(4)
        //then
        XCTAssertEqual(sut.head?.value, 4)
    }
    
    func test_4가있는리스트에서append호출시_7을전달하면_headnextvalue에7이할당되는지() {
        //given
        sut.append(4)
        //when
        sut.append(7)
        //then
        XCTAssertEqual(sut.head?.next?.value, 7)
    }
    
    // MARK:- removeFirst() tests
    func test_4가있는List에서_removeFirst호출시_4가반환되고head와tail이nil되는지() {
        //given
        sut.append(4)
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
