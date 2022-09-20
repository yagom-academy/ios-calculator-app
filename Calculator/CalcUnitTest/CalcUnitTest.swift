//
//  CalcUnitTest.swift
//  CalcUnitTest
//
//  Created by 서현웅 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalcUnitTest: XCTestCase {

    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_큐가비어있을때_enqueue함수_입력여부체크() {
        //given
        let input = "가나다"
        //when
        sut.enqueue(input)
        //then
        XCTAssertEqual(sut.queue, ["가나다"])
    }
}
