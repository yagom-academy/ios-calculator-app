import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    // MARK: Setting
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_parse(from input:String)
    func test피연산자와_연산자를_나눌_수_있는지1() {
        // given
        let input = "12+3-4"
        // when
        let result = ExpressionParser.parse(from: input).operators.displayItems()
        // then
        XCTAssertEqual(result, ["+","-"])
    }
    
    func test피연산자와_연산자를_나눌_수_있는지2() {
        // given
        let input = "12+3-4"
        // when
        let result = ExpressionParser.parse(from: input).operands.displayItems()
        // then
        XCTAssertEqual(result, [12,3,4])
    }
    
    func test연산자가_연속으로_들어와도_나눌_수_있는지1() {
        // given
        let input = "12+-3-4+5"
        // when
        let result = ExpressionParser.parse(from: input).operands.displayItems()
        // then
        XCTAssertEqual(result, [12,3,4,5])
    }
    func test연산자가_연속으로_들어와도_나눌_수_있는지2() {
        // given
        let input = "12+-3-4+5"
        // when
        let result = ExpressionParser.parse(from: input).operators.displayItems()
        // then
        XCTAssertEqual(result, ["+","-","-","+"])
    }
}
