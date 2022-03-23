import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func test_parse_식이_입력됐을때_연산자와_피연산자가_올바르게_분리되는가() {
        //given
        let formula = "1 + 3 - 4 / 2 * 1"

        //when
        let result = ExpressionParser.parse(from: formula)
        
        //then
        XCTAssertEqual(result.operators.count, 4)
        XCTAssertEqual(result.operands.count, 5)
    }
}
