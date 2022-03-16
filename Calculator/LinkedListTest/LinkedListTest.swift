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
    
    //MARK: append 함수 테스트
    func test_LinkedList에_1_2_3을_append했을때_1_2_3을_가지고있어야한다() {
        //given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        //when
        let result = sut.allElement()
        
        //then
        XCTAssertEqual(result, [1,2,3])
    }
    
    //MARK: removeFirst 함수 테스트
    func test_초기화된_LinkedList에서_removeFirst를_했을때_nil이_반환되어야한다() {
        //given, when, then
        XCTAssertNil(sut.removeFirst())
    }
    
    func test_1_2_3을_append한_LinkedList에서_removeFirst를_했을때_반환값이_1이고_2_3을_가지고있어야한다() {
        //given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        //when
        let data = sut.removeFirst()
        let result = sut.allElement()
        
        //then
        XCTAssertEqual(data, 1)
        XCTAssertEqual(result, [2,3])
    }
    
    //MARK: isEmpty 프로퍼티 테스트
    func test_LinkedList에_1을_append했을때_isEmpty가_false여야한다() {
        //given
        sut.append(1)

        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_LinkedList가_초기화되었을때_isEmpty가_true여야한다() {
        //given, when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    //MARK: - removeAll 함수 테스트
    func test_LinkedList에_1_2를_append한후_removeAll을_했을때_isEmpty가_true여야한다() {
        //given
        sut.append(1)
        sut.append(2)
        sut.removeAll()
        
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
}
