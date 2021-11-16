import XCTest
@testable import Calculator

class CalculateItemTests: XCTestCase {

    func test_Operator_add() {
        let `operator` = Operator.add
        let result = try?  `operator`.calculate(lhs: 1, rhs: 1)
        XCTAssertEqual(result, 2)
    }
    
    func test_Operator_subtract() {
        let `operator` = Operator.subtract
        let result = try? `operator`.calculate(lhs: 1, rhs: 1)
        XCTAssertEqual(result, 0)
    }
    
    func test_Operator_divide() {
        let `operator` = Operator.divide
        let result = try? `operator`.calculate(lhs: 5, rhs: 2)
        XCTAssertEqual(result, 2.5)
    }
    
    func test_Operator_multiply() {
        let `operator` = Operator.multiply
        let result = try? `operator`.calculate(lhs: 3, rhs: 2)
        XCTAssertEqual(result, 6)
    }
    
    func test_Operator_zero_division() {
        let `operator` = Operator.divide
        XCTAssertThrowsError(try `operator`.calculate(lhs: 3, rhs: 0))
    }
    
    func test_Operator_not_zero_division() {
        let `operator` = Operator.divide
        let result = try? `operator`.calculate(lhs: 0, rhs: 3)
        XCTAssertEqual(result, 0)
    }
}
