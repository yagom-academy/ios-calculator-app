
import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    func test_operation_allcases가_모든연산자를_포함하는지() {
        var opertaions = Operator.allCases.map { $0.rawValue }
        XCTAssertTrue(opertaions.contains("+"))
    }
    func test_componentsByoperator함수에_11더하기_12를_입력하면_11과_더하기와_12가_나오는지() {
        //given
        let result = testcomponentsByOperators(from: "11+12")
        //then
        XCTAssertEqual(result, ["11","+","12"])
    }
    func test_componentsByoperator함수에_11더하기12빼기13더하기14를하면_정상적으로_출력되는지() {
        let result = testcomponentsByOperators(from: "11+12-13+14")
        
        XCTAssertEqual(result, ["11","+","12","-","13","+","14"])
    }
    func test_componentsByoperator에_연산자를_제외한_다른_String을_입력했을때_걸러지지않는다() {
        let result = testcomponentsByOperators(from: "11+12@5+10")
        
        XCTAssertEqual(result[2], "12@5")
    }
    func test_componentsByoperator에_연산자_두개를_중복입력해도_서로_나눈다() {
        let result = testcomponentsByOperators(from: "11--13")
        XCTAssertEqual(result[0], "11")
        XCTAssertEqual(result[1], "-")
        XCTAssertEqual(result[2], "")
        XCTAssertEqual(result[3], "-")
    }

}
