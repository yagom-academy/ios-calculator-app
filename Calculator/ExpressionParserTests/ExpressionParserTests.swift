//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 써니쿠키 on 2022/09/22.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_string값의_식의_결과값이_356일때_string내부의값을_parse하여_연산한_결과값이_356와일치하는지() {
        let result: Double = 356
        var parse = ExpressionParser.parse(from: "123 + 233")

        XCTAssertEqual(result, try parse.result())
    }
    
    func test_양수234과_음수111_을_연산했을때_결과값으로_123이_나오는지(){
        let result: Double = 123
        var parse = ExpressionParser.parse(from: "234 + -111")
        
        XCTAssertEqual(result, try parse.result())
    }
    
    func test_양수233과_음수111을_곱하고_음수2로나누었을때_정상적인_값이_출력되는지() {
        let result: Double = (233 * -111) / -2
        var parse = ExpressionParser.parse(from: "233 × -111 ÷ -2")
        
        XCTAssertEqual(result, try parse.result())
        
    }
    
    func test_양수123을_0으로_나누었을때_에러를_던지는지(){
        var parse = ExpressionParser.parse(from: "123 ÷ 0")
        
        XCTAssertThrowsError(try parse.result())
    }
    
    func test_양수123과_양수122를_더했을때_플러스가아닌_연산자가아닌_문자가_들어갔을때_에러를_던지는지(){
        var parse = ExpressionParser.parse(from: "123 a 122")
        
        XCTAssertThrowsError(try parse.result())
    }
    
    func test_양수200과_양수100를_더했을때_플러스가아닌_연산자가아닌_다른특수문자가_들어갔을때_에러를_던지는지(){
        var parse = ExpressionParser.parse(from: "200 # 100")
        
        XCTAssertThrowsError(try parse.result())
    }
    
    func test_parse_문자열을_연산자기호와숫자로나누어_Formula로반환확인() throws {
        //given 연산자기호가 섞인 문자열을
        let a = "1 + 23 × 456"
        
        //when 연산자기호와 숫자로나누어 큐에담은 formula를생성할시
        sut = ExpressionParser.parse(from: a)
        
        //then formula의 숫자는 operands, 기호는 operators의 큐에담긴다.
        let expectedOperand: [Double] = [1, 23, 456]
        let expectedOperator: [Character] = ["+", "×"]
        
        XCTAssertEqual(expectedOperand[0], sut.operands.dequeue()?.data)
        XCTAssertEqual(expectedOperand[1], sut.operands.dequeue()?.data)
        XCTAssertEqual(expectedOperand[2], sut.operands.dequeue()?.data)

        XCTAssertEqual(expectedOperator[0], sut.operators.dequeue()?.data?.rawValue)
        XCTAssertEqual(expectedOperator[1], sut.operators.dequeue()?.data?.rawValue)
        
        //의도한 fail test
        XCTAssertNotEqual(expectedOperand[0], sut.operands.dequeue()?.data)
        XCTAssertNotEqual(expectedOperator[0], sut.operators.dequeue()?.data?.rawValue)
    }
}
