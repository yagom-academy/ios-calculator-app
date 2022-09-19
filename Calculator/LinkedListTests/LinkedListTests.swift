//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 맹선아 on 2022/09/19.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList! = LinkedList<Int>()

    override func setUpWithError() throws {
        try super .setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super .tearDownWithError()
        sut = nil
    }

    func test_append메서드_head가nil일때_숫자추가시_head가같은수인지확인() throws {
        //given head가 nil일 때
        sut.head = nil
        
        //when append메서드로 랜덤 숫자를 추가해준다면
        let randomNumber = Int.random(in: 1...10)
        sut.append(randomNumber)
        
        //then 추가해준 랜덤수와 sut의 head프로퍼티값이 같다.
        XCTAssertEqual(randomNumber, sut.head?.data)
    }
    
    func test_append메서드_head가nil이아닌1_2가담겨있을때_3추가시_추가되었는지확인() throws {
        //given head가 nil이 아닐 때
        sut.head = nil
        sut.append(1)
        sut.append(2)
        
        //when append메서드로 랜덤 숫자를 추가해준다면
        sut.append(3)
        
        //then 추가해준 3이 담겨있다
        XCTAssertEqual(3, sut.head?.next?.next?.data)
        return
    }
}

