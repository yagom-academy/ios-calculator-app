//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by DuDu on 2022/03/15.
//

import XCTest
@testable import Calculator

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_LinkedList에_1_2_3을_넣었을때_1_2_3을_가지고있는지() {
        //given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        //when
        let result = sut.allElement()
        
        //then
        XCTAssertEqual(result, [1,2,3])
    }
    
    func test_LinkedList에_1을_넣었을때_isEmpty가_false인지() {
        //given
        sut.append(1)

        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_LinkedList가_비어있을때_isEmpty가_true인지() {
        //given

        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
}
