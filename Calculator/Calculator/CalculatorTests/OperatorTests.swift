import XCTest
@testable import Calculator
class OperatorTests: XCTestCase {
    func test_calculate_add했을때_결과값이_올바른가() {
        //given
        let add = Operator.add
        
        //when
        let result = add.calculate(lhs: 3, rhs: 3)
        
        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_calculate_substract했을때_결과값이_올바른가() {
        //given
        let sub = Operator.substract
        
        //when
        let result = sub.calculate(lhs: 3, rhs: 3)
        
        //then
        XCTAssertEqual(result, 0)
    }
}
