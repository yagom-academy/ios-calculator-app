import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
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
    
    func test_parse_숫자와기호가무작위로들어왔을때_연산자를분리하는지() {
        // givwn
        let input = "2*+2857//24-"
        let expectation: [Operator] = [.multiply, .add, .divide, .divide, .subtract]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operators.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_숫자와기호가무작위로들어왔을때_피연산자를분리하는지() {
        // givwn
        let input = "2*+2857//24-3"
        let expectation: [Double] = [2, 2857, 24, 3]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operands.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_연산자만들어있을때_연산자만분리되어들어가는지() {
        // givwn
        let input = "*+//-"
        let expectation: [Operator] = [.multiply, .add, .divide, .divide, .subtract]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operators.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_연산자만들어있을때_피연산자큐는nil인지() {
        // givwn
        let input = "*+//-"

        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operands.calculatorItems
        
        // then
        XCTAssertNil(result)
    }
}
