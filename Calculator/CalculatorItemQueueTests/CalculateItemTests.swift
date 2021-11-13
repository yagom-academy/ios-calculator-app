import XCTest
@testable import Calculator

class CalculateItemTests: XCTestCase {

    func test_Operator_add() {
        let `operator` = Operator.add
        let result = `operator`.calculate(lhs: 1, rhs: 1)
        XCTAssertEqual(result, 2)
    }
    
    func test_Operator_subtract() {
        let `operator` = Operator.subtract
        let result = `operator`.calculate(lhs: 1, rhs: 1)
        XCTAssertEqual(result, 0)
    }
    
    func test_Operator_divide() {
        let `operator` = Operator.divide
        let result = `operator`.calculate(lhs: 5, rhs: 2)
        XCTAssertEqual(result, 2.5)
    }
    
    func test_Operator_multiply() {
        let `operator` = Operator.multiply
        let result = `operator`.calculate(lhs: 3, rhs: 2)
        XCTAssertEqual(result, 6)
    }
}
