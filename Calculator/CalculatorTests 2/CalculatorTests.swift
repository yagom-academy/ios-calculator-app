//
//  CalculatorTests2.swift
//  CalculatorTests2
//
//  Created by 맹선아 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue! = CalculatorItemQueue()

    override func setUpWithError() throws {
        try super .setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super .tearDownWithError()
        sut = nil
    }

    func test_enqueue메서드_비어있는itemQueue에_10추가시_head가10() throws {
        //given itemQueue.head가 nil 일때
        sut.itemQueue.head = nil
        
        //when 10을 추가해주면
        sut.enqueue(10)
        
        //then itemQueue.head가 10입니다.
        XCTAssertEqual(10, sut.itemQueue.head?.data)
    }
}
