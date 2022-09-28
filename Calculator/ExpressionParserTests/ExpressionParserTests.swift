//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 써니쿠키 on 2022/09/22.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var result1: [String]!
    var result2: Formula!
    
    override func setUpWithError() throws {
        result1 = [String]()
        result2 = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.setUpWithError()
        result1 = nil
        result2 = nil
    }
    
    func test_parse_문자열을_연산자기호와숫자로나누어_Formula로반환확인() throws {
        //given 연산자기호가 섞인 문자열을
        let a = "1+23*456"
        
        //when 연산자기호와 숫자로나누어 큐에담은 formula를생성할시
        result2 = try ExpressionParser.parse(from: a)
    
        //then formula의 숫자는 operands, 기호는 operators의 큐에담긴다.
        let expectedOperand: [Double] = [1,23,456]
        let expectedOperator: [Character] = ["+", "*"]
        
        XCTAssertEqual(expectedOperand[0], result2.operands.dequeue()?.data)
        XCTAssertEqual(expectedOperand[1], result2.operands.dequeue()?.data)
        XCTAssertEqual(expectedOperand[2], result2.operands.dequeue()?.data)

        XCTAssertEqual(expectedOperator[0], result2.operators.dequeue()?.data?.rawValue)
        XCTAssertEqual(expectedOperator[1], result2.operators.dequeue()?.data?.rawValue)
        
        //의도한 fail test
        XCTAssertNotEqual(expectedOperand[0], result2.operands.dequeue()?.data)
        XCTAssertNotEqual(expectedOperator[0], result2.operators.dequeue()?.data?.rawValue)
    }
}
