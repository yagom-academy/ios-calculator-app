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
    
    func test_append호출시_4를전달하면_headvalue에4가할당되는지() {
        //given
        //when
        sut.append(4)
        //then
        XCTAssertEqual(sut.head?.value, 4)
    }
}
