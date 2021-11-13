import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    func test_parse() {
        let operands: [Double] = [1, 2, 3, 4, 5]
        let operators = ["+", "-", "*", "/"].compactMap { Operator(rawValue: $0) }
        var formula = Formula(operands: CalculatorItemQueue(operands),
                              operators: CalculatorItemQueue(operators))
        let input = "1+2-3*4/5"
        var formulaFromText = ExpressionParser.parse(from: input)
        XCTAssertEqual(formulaFromText.result(), formula.result())
    }
}
