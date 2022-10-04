//  Created by Aejong on 2022/09/28

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    func test_parse_operands에_input을_넣었을때_dequeue값이_순서에맞게_operand만_나와야함() {
        let input = "23 + 13 - 53 * 14 / 6"
        var result = ExpressionParser.parse(from: input).operands
        
        let testOperands: [Double] = [23, 13, 53, 14, 6]
        
        XCTAssertEqual(testOperands[0], result.dequeue())
        XCTAssertEqual(testOperands[1], result.dequeue())
        XCTAssertEqual(testOperands[2], result.dequeue())
        XCTAssertEqual(testOperands[3], result.dequeue())
        XCTAssertEqual(testOperands[4], result.dequeue())
    }
    
    func test_parse_operators에_input을_넣었을때_dequeue값이_operator값과_순서가_동일해야함() {
        let input = "23 + 13 - 53 * 14 / 6"
        var result = ExpressionParser.parse(from: input).operators
        let testOperators = ["+", "-", "*", "/"]

        XCTAssertEqual(Operator(rawValue: Character(testOperators[0])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[1])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[2])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[3])), result.dequeue())
    }
    
    func test_문자열로수식을입력받았을때_parse호출및result호출시_피연산자와연산자가분리돼계산되어야한다() {
        // given
        let input = "10 + 90 / 10"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        var result:Double = 0
        
        do {
            result = try formula.result()
        } catch CalculateError.invalidNumber {
            print("0으로 나눌 수 없습니다")
        } catch {
            
        }
        
        // then
        XCTAssertEqual(result, 10.0)
    }
}
