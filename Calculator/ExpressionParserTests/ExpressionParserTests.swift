import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func test_parse_formula의operands에123만들어가는지() {
        // givwn
        let input = "11+244-3"
        let expectation: [Double] = [11, 244, 3]
        
        // when
        let result = try? ExpressionParser.parse(from: input).operands.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_formula의operators에연산자만들어가는지() {
        // givwn
        let input = "2*12/8"
        let expectation: [Operator] = [.multiply, .divide]
        
        // when
        let result = try? ExpressionParser.parse(from: input).operators.calculatorItems
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_숫자와기호가무작위로들어왔을때_에러를반환하는지() {
        // givwn
        let input = "2*+2857//24-"

        // when
        let result = try? ExpressionParser.parse(from: input)
        
        // then
        XCTAssertNil(result)
    }
    
    
    func test_parse_연산자만들어있을때_에러를반환하는지() {
        // givwn
        let input = "*+//-"

        // when
        let result = try? ExpressionParser.parse(from: input)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_parse_피연산자만들어있을때_에러를반환하는지() {
        // givwn
        let input = "123456"

        // when
        let result = try? ExpressionParser.parse(from: input)
        
        // then
        XCTAssertNil(result)
    }
}
