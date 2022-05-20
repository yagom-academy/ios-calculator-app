import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse_formula의operands에123만들어가는지() {
        // givwn
        let input = "11+244-3"
        let expectation: [Double] = [11, 244, 3]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operands.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_formula의operators에연산자만들어가는지() {
        // givwn
        let input = "2*12/8"
        let expectation: [Operator] = [.multiply, .divide]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operators.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
