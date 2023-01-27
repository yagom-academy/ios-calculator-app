//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 김성준 on 2023/01/27.
//

import XCTest

final class ExpressionParserTest: XCTestCase {

    
    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
      
    }

    func test_정상적인값이_주어졌을때_Parse를_실행하면_Formula인스턴스의_operator그리고operand큐에_요소가_추가된다() {
        //give
        let string = "30 + 25 - 29"
        
        //when
        let formula = ExpressionParser.parse(from: string)
        
        //then
        let result = formula.operands.isEmpty && formula.operators.isEmpty
        let expectation = false
        
        XCTAssertEqual(result, expectation)
    }
 

}
