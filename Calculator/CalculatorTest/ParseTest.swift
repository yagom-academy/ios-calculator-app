//
//  ParseTest.swift
//  CalculatorTest
//
//  Created by dhoney96 on 2022/06/02.
//

import XCTest
@testable import Calculator

class ParseTest: XCTestCase {
    var sut: ExpressionParser.Type?
     
     override func setUpWithError() throws {
         try super.setUpWithError()
         sut = ExpressionParser.self
     }
     
     override func tearDownWithError() throws {
         try super.tearDownWithError()
         sut = nil
     }

     func test_ExpressionParser에서_input을집어넣어_parse를호출하고_result함수를_호출하면_계산이잘되는가() {
         //given
         let input = "1+2−3+4÷2"
         
         //when
         var test: Formula
         
         test = ExpressionParser.parse(from: input)

         let result = try? test.result()
         
         
         //then
         XCTAssertEqual(result, 2.0)
     }
     
     func test_ExpressionParser에서_input을집어넣어_parse를호출하고_result함수를_호출하였을때마지막숫자가0이면_에러를던지는가() {
         //given
         let input = "1+2−3+4÷0"
         
         //when
         var test: Formula
         
         test = ExpressionParser.parse(from: input)

         //then
         XCTAssertThrowsError(try test.result())
     }
     
     func test_ExdpressionParser에서_input을집어넣어_parse를호출하고_result함수를_호출하였을때마지막숫자가1의자릿수가아니어도_계산을잘하는가() {
         //given
         let input = "1+2−3+4−100"
         
         //when
         var test: Formula
         
         test = ExpressionParser.parse(from: input)

         //then
         XCTAssertEqual(try test.result(), -96)
     }
     
     func test_ExdpressionParser에서_input을집어넣어_parse를호출하고_result함수를_호출하였을때마지막숫자의1의자릿수에0이들어있어도_에러로던지지않는가() {
         //given
         let input = "1+2−3+4−100"
         
         //when
         var test: Formula
         
         test = ExpressionParser.parse(from: input)

         //then
         XCTAssertNoThrow(try test.result())
     }
     
     func test_ExdpressionParser에서_input을집어넣어_parse를호출하고_result함수를_호출하였을때_input에음수가들어있어도계산을잘하는가() {
         //given
         let input = "1+2−-3+4−-100"
         
         //when
         var test: Formula
         
         test = ExpressionParser.parse(from: input)

         //then
         XCTAssertEqual(try test.result(), 110.0)
     }
}
