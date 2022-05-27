import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_parse(from input:String)
    func test피연산자와_연산자를_나눌_수_있는지1() {
        // given
        let input = "12+3÷4"
        // when
        let result = ExpressionParser.parse(from: input).operators.displayItems()
        // then
        XCTAssertEqual(result, ["+","÷"])
    }
    
    func test피연산자와_연산자를_나눌_수_있는지2() {
        // given
        let input = "12+3−4"
        // when
        let result = ExpressionParser.parse(from: input).operands.displayItems()
        // then
        XCTAssertEqual(result, [12.0,3.0,4.0])
    }
    
    func test피연산자와_연산자를_나눌_수_있는지3() {
        // given // −
        let input = "12+-3−4"
        // when
        let result = ExpressionParser.parse(from: input).operands.displayItems()
        // then
         XCTAssertEqual(result, [12.0,-3.0,4.0])
    }
}
