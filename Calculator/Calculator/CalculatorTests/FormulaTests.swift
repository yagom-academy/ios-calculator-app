import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    func test_result_식이_주어졌을때_연산결과가_올바른가() {
        //given
        let formula = "1 + 3 - 3 / 1 * 1"
        
        //when
        var formulaInstance = ExpressionParser.parse(from: formula)
        let result = formulaInstance.result()
        
        //then
        XCTAssertEqual(result, 1)
    }
}
