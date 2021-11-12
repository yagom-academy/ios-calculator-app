import XCTest

class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_sampleString을_componentsByOperators하면_숫자만_들어있는_배열이_반환된다() {
        let sampleString: String = "11+2-33*4/55+6"
        let result = ExpressionParser.componentsByOperators(from: sampleString)
        XCTAssertEqual(result, ["11", "2", "33", "4", "55", "6"])
    }
}
