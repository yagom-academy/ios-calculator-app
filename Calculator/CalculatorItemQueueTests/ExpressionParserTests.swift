//
//  ExpressionParserTests.swift
//  Created by 미니.
//
import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
 
    func test_숫자와_연산자를_구분해서_파싱했는가() {
        // given
        let input: String = "10+9×8"
        
        // when
        var form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()

        // then
        XCTAssertEqual(result, 152)
    }
    
    func test_첫번째_피연산자가_마이너스10일때_마이너스10으로_파싱했는가() {
        // given
        let input: String = "-10+9×876"
        
        // when
        var form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
            
        // then
        XCTAssertEqual(result, -876)
    }
    
    func test_빼기_연산기호_뒤에_마이너스6이_오는_경우_마이너스6으로_파싱했는가() {
        // given
        let input: String = "-10+9--6"
        
        // when
        var form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
            
        // then
        XCTAssertEqual(result, 5)
    }
}

