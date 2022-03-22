import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse호출시_from에앞뒤공백이없는계산식을넣으면_옳바른결과를반환하는지() {
        //given
        let input = "3 + 4 × -2 ÷ 7"
        //when
        var result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(result.result(), -2)
    }
    
    func test_parse호출시_from에앞에만공백인계산식을넣으면_옳바른결과를반환하는지() {
        //given
        let input = " 3 + 4 × -2 ÷ 7"
        //when
        var result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(result.result(), -2)
    }
    
    func test_parse호출시_from에뒤에만공백인계산식을넣으면_옳바른결과를반환하는지() {
        //given
        let input = "3 + 4 × -2 ÷ 7 "
        //when
        var result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(result.result(), -2)
    }
    
    func test_parse호출시_from에앞뒤모두공백인계산식을넣으면_옳바른결과를반환하는지() {
        //given
        let input = " 3 + 4 × -2 ÷ 7 "
        //when
        var result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(result.result(), -2)
    }
}
