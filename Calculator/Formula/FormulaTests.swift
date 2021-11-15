import XCTest

class FormulaTests: XCTestCase {
    var sut: ExpressionParser.Type! = ExpressionParser.self
    
    func 일_더하기_이를_입력하면_삼_반환() {
        var formula = Formula()
        formula = sut.parse(from: "1+2")
        let result = try? formula.result()
        XCTAssertEqual(result, 3)
    }
        
    func test_나누기0을_하면_divideByZero에러_throw() {
        var formula = Formula()
        do {
            try formula = sut.parse(from: "1+2/0")
        } catch ErrorCase.divideByZero {
            XCTAssertThrowsError(ErrorCase.divideByZero)
        }
    }
    

}
