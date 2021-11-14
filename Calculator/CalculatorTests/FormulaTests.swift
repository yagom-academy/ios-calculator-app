
import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result호출시_Operand가모두양수일때_값이정상적으로나오는지() {
        let input = "121/11+1+1×3_1"
        sut = ExpressionParser.parse(from: input)
        let result = try! sut.result()
        
        XCTAssertEqual(result, 38.0)
    }
    
    func test_result호출시_Operand에음수포함되있을때_값이정상적으로나오는지() {
        let input = "121/-11+1+-1×3_1"
        sut = ExpressionParser.parse(from: input)
        let result = try! sut.result()
        XCTAssertEqual(result, -34.0)
    }
    
    func test_result호출시_Operand가모두음수일때_값이정상적으로나오는지() {
        let input = "-121/-11+-1+-1×-3_-1"
        sut = ExpressionParser.parse(from: input)
         let result = try! sut.result()
        XCTAssertEqual(result, -26.0)
    }
}
