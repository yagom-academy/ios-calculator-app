
import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula = Formula()
    
    func test_When_operands_empty_Expect_0() {
        //given
        formula.operators.enqueue(Operator.add)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_When_operators_empty_Expect_first_enqueue_operand() {
        //given
        formula.operands.enqueue(3)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, 3)
    }

    func test_When_add_multiply_in_operators_Expect_calculate_add_first() {
        //given
        formula.operands.enqueue(3)
        formula.operators.enqueue(Operator.add)
        formula.operands.enqueue(5)
        formula.operators.enqueue(Operator.multiply)
        formula.operands.enqueue(-2)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, -16)
    }
    
    func test_When_divideByZero_multiply_Expect_isNaN_true() {
        //given
        formula.operands.enqueue(3)
        formula.operators.enqueue(Operator.divide)
        formula.operands.enqueue(0)
        formula.operators.enqueue(Operator.add)
        formula.operands.enqueue(-2)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }

}
