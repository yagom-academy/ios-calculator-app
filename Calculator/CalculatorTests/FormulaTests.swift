import XCTest

class FormulaTests: XCTestCase {
    func test_sampleString을_parse하고_반환된_Formula의_결과값은_4점545454545454545이다() {
        let sampleString: String = "11+2-33*4/55+6"
        var formula = ExpressionParser.parse(from: sampleString)
        let result = formula.result()
        XCTAssertEqual(result, 4.545454545454545)
    }
    
    func test_sampleString을_parse하고_반환된_Formula의_결과값은_51점25이다() {
        let sampleString: String = "1+2*3/4+55+3-9"
        var formula = ExpressionParser.parse(from: sampleString)
        let result = formula.result()
        XCTAssertEqual(result, 51.25)
    }
}
