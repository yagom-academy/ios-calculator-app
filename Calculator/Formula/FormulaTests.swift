import XCTest

class FormulaTests: XCTestCase {
    var sut: ExpressionParser.Type! = ExpressionParser.self
    
    func test_일_더하기_이를_입력하면_삼_반환() {
        var formula = Formula()
        formula = sut.parse(from: "1+2")
        let result = try? formula.result()
        XCTAssertEqual(result, 3)
    }
        
    func test_나누기0을_하면_nan_반환() {
        var formula = Formula()
        formula = sut.parse(from: "4*2/0")
        let result = try? formula.result()
        XCTAssertEqual(result, .nan)
    }
    
}
