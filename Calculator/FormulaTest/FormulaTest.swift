//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 최최성균 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    //MARK: - result()
    func test_result호출시_6나누기3빼기6곱하기4진행시_음수16을반환하는지() {
        //given
        sut.operands.enqueue(6)
        sut.operands.enqueue(3)
        sut.operations.enqueue(.divide)
        sut.operands.enqueue(6)
        sut.operations.enqueue(.subtract)
        sut.operands.enqueue(4)
        sut.operations.enqueue(.multiply)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, -16)
    }
    
    func test_result호출시_6인큐후연산자가없을경우_6을반환하는지() {
        //given
        sut.operands.enqueue(6)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_result호출시_연산자만있을경우_0을반환하는지() {
        //given
        sut.operations.enqueue(.divide)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
}
