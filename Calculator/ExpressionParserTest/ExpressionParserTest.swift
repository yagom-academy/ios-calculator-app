import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse호출시_from에계산식을넣으면_옳바른결과를바환하는지() {
        //given
        let input = " 3 + 4 × -2 ÷ 7"
        let input2 = "3 + 4 × -2 ÷ 7"
        let input3 = "3 + 4 × -2 ÷ 7 "
        let input4 = " 3 + 4 × -2 ÷ 7 "
        //when
        var result = ExpressionParser.parse(from: input)
        var result2 = ExpressionParser.parse(from: input2)
        var result3 = ExpressionParser.parse(from: input3)
        var result4 = ExpressionParser.parse(from: input4)
        //then
        XCTAssertEqual(result.result(), -2)
        XCTAssertEqual(result2.result(), -2)
        XCTAssertEqual(result3.result(), -2)
        XCTAssertEqual(result4.result(), -2)
    }
}
