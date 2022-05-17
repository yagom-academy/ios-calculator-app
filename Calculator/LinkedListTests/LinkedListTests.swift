//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by NAMU on 2022/05/17.
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
    
    func test_append_값3개_추가하기() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        // when
        let result1 = sut.head?.data
        let result2 = sut.head?.next?.data
        let result3 = sut.head?.next?.next?.data
        
        // then
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertEqual(result3, 3)
    }
    
    func test_takeOutFirst_값이있을때_값을반환하는지() {
        // given
        sut.append(data: 1)
        
        // when
        let result = sut.takeOutFirst()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_takeOutFirst_두번실행할때_첫번째값을지우고_두번째값을반환하는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        
        // when
        let result1 = sut.takeOutFirst()
        let result2 = sut.takeOutFirst()
        
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
    
    func test_isEmpty_값이있을때_false를_리턴하는지() {
        // given
        sut.append(data: 1)
        
        // when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result)
    }
}
