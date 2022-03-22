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
    
    func test_calculate_divide했을때_결과값이_올바른가() {
        //given
        let divide = Operator.divide
        
        //when
        let result = divide.calculate(lhs: 3, rhs: 3)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_calculate_0으로_divide했을때_결과값이_nan인가() {
        //given
        let divide = Operator.divide
        
        //when
        let result = divide.calculate(lhs: 3, rhs: 0)
    
        //then
        XCTAssertTrue(result.isNaN)
    }
}
