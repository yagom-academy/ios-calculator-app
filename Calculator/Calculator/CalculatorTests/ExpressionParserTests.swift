import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func test_parse_식이_입력됐을때_연산자와_피연산자가_올바르게_분리되는가() {
        //given
        let formula = "1 + 3 - 4 / 2 * 1"

        //when
        do {
            let result = try ExpressionParser.parse(from: formula)
            
            //then
            XCTAssertEqual(result.operators.count, 4)
            XCTAssertEqual(result.operands.count, 5)
        } catch {
            print(error)
        }
    }
    
    func test_parse_연산자_외에_문자가_입력됐을때_발생하는_에러가_올바른가() {
        //given
        let formula = "1 & -3 - 3 / 1 * 3"
        let expectedError = CalculateError.wrongInputFormula
        
        //then
        XCTAssertThrowsError(try ExpressionParser.parse(from: formula)) { error in
            XCTAssertEqual(error as? CalculateError, expectedError)
        }
    }
    
    func test_parse_연산자가_입력안됐을때_발생하는_에러가_올바른가() {
        //given
        let formula = "1 3"
        let expectedError = CalculateError.wrongInputFormula
        
        //then
        XCTAssertThrowsError(try ExpressionParser.parse(from: formula)) { error in
            XCTAssertEqual(error as? CalculateError, expectedError)
        }
    }
    
    func test_parse_연산자만_입력됐을때_발생하는_에러가_올바른가() {
        //given
        let formula = "+ -"
        let expectedError = CalculateError.wrongInputFormula
        
        //then
        XCTAssertThrowsError(try ExpressionParser.parse(from: formula)) { error in
            XCTAssertEqual(error as? CalculateError, expectedError)
        }
    }
    
    func test_parse_연산자가_피연산자_보다_많을때_발생하는_에러가_올바른가() {
        //given
        let formula = "+ 1 -"
        let expectedError = CalculateError.wrongInputFormula
        
        //then
        XCTAssertThrowsError(try ExpressionParser.parse(from: formula)) { error in
            XCTAssertEqual(error as? CalculateError, expectedError)
        }
    }
}
