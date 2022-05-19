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

    //MARK: - append test
    func test_append_값1개_추가하기() {
        // given
        sut.append(data: 1)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, 1)
    }

    //MARK: - removeFirst test
    func test_removeFirst_값이있을때_값을반환하는지() {
        // given
        sut.append(data: 1)
        
        // when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_removeFirst_두번실행할때_첫번째값을지우고_두번째값을반환하는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        
        // when
        let result1 = sut.removeFirst()
        let result2 = sut.removeFirst()
        
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
    
    //MARK: - isEmpty test
    func test_isEmpty_값이있을때_false를_리턴하는지() {
        // given
        sut.append(data: 1)
        
        // when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result)
    }
    
    //MARK: - removeAll test
    func test_removeAll_값이있을때_모든값을제거하는지() {
        // given
        sut.append(data: 1)
        
        // when
        sut.removeAll()
        let result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result)
    }
}
