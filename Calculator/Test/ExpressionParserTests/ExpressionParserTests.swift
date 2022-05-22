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
    func test피연산자와_연산자를_나눌_수_있는지() {
        // given
        let input = "12+3-4"
        // when
        let result = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(result.operands.displayItems(),[12, 3, 4])
    }
}
