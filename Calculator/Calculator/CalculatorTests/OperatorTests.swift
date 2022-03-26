import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    let lhs:Double = 3
    let rhs:Double = 3
    
    func test_calculate_add했을때_결과값이_올바른가() {
        //given
        let add = Operator.add

        //when
        let result = add.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, lhs + rhs)
    }
    
    func test_calculate_substract했을때_결과값이_올바른가() {
        //given
        let sub = Operator.substract
        
        //when
        let result = sub.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, lhs - rhs)
    }
    
    func test_calculate_divide했을때_결과값이_올바른가() {
        //given
        let divide = Operator.divide
        
        //when
        let result = divide.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, lhs / rhs)
    }
    
    func test_calculate_0으로_divide했을때_결과값이_nan인가() {
        //given
        let divide = Operator.divide
        
        //when
        let result = divide.calculate(lhs: lhs, rhs: 0)
    
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_calculate_multiply했을때_결과값이_올바른가() {
        //given
        let multiply = Operator.multiply
        
        //when
        let result = multiply.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, lhs * rhs)
    }
    
    func test_characterToString_결과값이_올바른가() {
        //when
        let result = Operator.characterToString()
        
        //then
        XCTAssertEqual(result, ["+", "-", "/", "*"])
    }
}
