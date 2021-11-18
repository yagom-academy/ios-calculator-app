import XCTest

class ExpressionParserTests: XCTestCase {
    func test_sampleString을_componentsByOperators하면_숫자만_들어있는_배열이_반환된다() {
        let sampleString: String = "11+2−33×4÷55+6"
        let result = ExpressionParser.componentsByOperators(from: sampleString)
        XCTAssertEqual(result, ["11", "2", "33", "4", "55", "6"])
    }
    
    func test_sampleString을_parse하면_숫자큐와_연산자큐가_들어있는_Formula가_반환된다() {
        let sampleString: String = "11+2−33×4÷55+6"
        let formula = ExpressionParser.parse(from: sampleString)
        XCTAssertEqual(formula.operands.scanAllValues(), [11, 2, 33, 4, 55, 6])
        XCTAssertEqual(formula.operators.scanAllValues(), [Operator.add, Operator.subtract, Operator.multiply, Operator.divide, Operator.add])
    }
}
