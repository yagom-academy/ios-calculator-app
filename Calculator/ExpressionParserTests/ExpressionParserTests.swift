//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func test_string값의_식의_결과값이_356일때_string내부의값을_parse하여_연산한_결과값이_356와일치하는지() {
        let result: Double = 356
        var parse = try? ExpressionParser.parse(from: "123 + 233")

        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_양수234과_음수111_을_연산했을때_결과값으로_123이_나오는지(){
        let result: Double = 123
        var parse = try? ExpressionParser.parse(from: "234 + -111")
        
        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_양수233과_음수111을_곱하고_음수2로나누었을때_정상적인_값이_출력되는지() {
        let result: Double = (233 * -111) / -2
        var parse = try? ExpressionParser.parse(from: "233 * -111 / -2")
        
        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_양수123을_0으로_나누었을때_에러를_던지는지(){
        var parse = try? ExpressionParser.parse(from: "123 / 0")
        
        XCTAssertThrowsError(try parse?.result())
    }
    
    func test_양수123과_양수122를_더했을때_플러스가아닌_연산자가아닌_문자가_들어갔을때_에러를_던지는지(){
        var parse = try? ExpressionParser.parse(from: "123 a 123")
        
        XCTAssertThrowsError(try parse?.result())
    }
    
    func test_양수200과_양수100를_더했을때_플러스가아닌_연산자가아닌_다른특수문자가_들어갔을때_에러를_던지는지(){
        var parse = try? ExpressionParser.parse(from: "123 # 123")
        
        XCTAssertThrowsError(try parse?.result())
    }
    
}
