
import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    func test_When_inputString_Expect_Formula_result() {
           //given
           let input = "3 + 4 × -2"
           
           //when
           var formula = ExpressionParser.parse(from: input)
           let result = try? formula.result()
           
           //then
           XCTAssertEqual(result, -14)
       }
    
    func test_When_inputString_Expect_Formula_result2() {
           //given
           let input = "5 + 4 ÷ 2"
           
           //when
           var formula = ExpressionParser.parse(from: input)
           let result = try? formula.result()
           
           //then
        XCTAssertEqual(result, 4.5)
       }
    
    func test_When_inputString_Expect_Formula_result3() {
           //given
           let input = "3 ÷ 0"
           
           //when
           var formula = ExpressionParser.parse(from: input)
           let result = try? formula.result()
           
           //then
        XCTAssertEqual(result?.isNaN, true)
       }

}
