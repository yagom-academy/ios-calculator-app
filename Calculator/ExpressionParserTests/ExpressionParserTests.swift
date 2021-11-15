//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    /**
     테스트 케이스 (수식, 결과([피연산자] : [연산자]))
     1. ("10000000000÷3", [10000000000, 3] : [/] ),
     2. ("10000000000÷3×3", [10000000000, 3, 3] : [/, *]),
     3. ("12+-3÷-2−0.05", [12, -3, -2, 0.05] : [+, /, -]),
     4. ("3÷0×3−5×-0.05", [3 / 0 * 3 * (-5) - 0.05] : [/, *, *, -]),
     5. ("132+43÷-42×3−56×-0.05", [132.0, 43.0, -42.0, 3.0, 56.0, -0.05] : [+, /, *, -, *])
     */
    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse호출시_1번케이스에대해_올바른결과반환하는지() {
        //given
        let input = "10000000000÷3"
        let expectedResult: Double = 10000000000 / 3
        //when
        var result = sut.parse(from: input)
        //then
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_parse호출시_2번케이스에대해_올바른결과반환하는지() {
        //given
        let input = "10000000000÷3×3"
        let expectedResult: Double = 10000000000 / 3 * 3
        //when
        var result = sut.parse(from: input)
        //then
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_parse호출시_3번케이스에대해_올바른결과반환하는지() {
        //given
        let input = "12+-3÷-2−0.05"
        let expectedResult: Double = (12 + (-3)) / (-2) - 0.05
        //when
        var result = sut.parse(from: input)
        //then
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_parse호출시_4번케이스에대해_올바른결과반환하는지() {
        //given
        let input = "3÷0×3−5×-0.05"
        //when
        var result = sut.parse(from: input)
        //then
        XCTAssertTrue(result.result().isNaN)
    }
    
    func test_parse호출시_5번케이스에대해_올바른결과반환하는지() {
        //given
        let input = "132+43÷-42×3−56×-0.05"
        let expectedResult: Double = ((132.0 + 43.0) / (-42.0) * 3.0 - 56.0) * (-0.05)
        //when
        var result = sut.parse(from: input)
        //then
        XCTAssertEqual(result.result(), expectedResult)
    }
}
