import XCTest

class FormulaTests: XCTestCase {
    func test_sampleString을_parse하고_반환된_Formula를_result하면_4점545454545454545이_반환된다() {
        let sampleString: String = "11+2-33*4/55+6"
        var formula = ExpressionParser.parse(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, 4.545454545454545)
        } catch {
            print(error)
        }
    }
    
    func test_sampleString을_parse하고_반환된_Formula를_result하면_51점25이_반환된다() {
        let sampleString: String = "1+2*3/4+55+3-9"
        var formula = ExpressionParser.parse(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, 51.25)
        } catch {
            print(error)
        }
    }
    
    func test_빈_String을_parse하고_반환된_Formula를_result하면_queueIsEmpty에러가_발생한다() {
        let sampleString: String = ""
        var formula = ExpressionParser.parse(from: sampleString)
        do {
            let _ = try formula.result()
        } catch FormulaError.queueIsEmpty {
            XCTAssertEqual(FormulaError.queueIsEmpty.description, "Dequeue 할 값이 존재하지 않습니다")
        } catch  {
            print(error)
        }
    }
    
    func test_1더하기_String을_parse하고_반환된_Formula를_result하면_queueIsEmpty에러가_발생한다() {
        let sampleString: String = "1+"
        var formula = ExpressionParser.parse(from: sampleString)
        do {
            let _ = try formula.result()
        } catch FormulaError.queueIsEmpty {
            XCTAssertEqual(FormulaError.queueIsEmpty.description, "Dequeue 할 값이 존재하지 않습니다")
        } catch  {
            print(error)
        }
    }
}
