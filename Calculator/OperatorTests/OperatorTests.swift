
import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    
    func test_When_add_opperator_Expect_lhs_add_rhs() {
        //given
        let testoperator = Operator.add

        //when
        let result = testoperator.calculate(lhs: 2, rhs: 3)

        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_When_subtract_opperator_Expect_lhs_subtract_rhs() {
        //given
        let testoperator = Operator.subtract

        //when
        let result = testoperator.calculate(lhs: 5, rhs: 6)
        //then
        XCTAssertEqual(result, -1)
    }

    func test_When_divide_opperator_Expect_lhs_divide_rhs() {
        //given
        let testoperator = Operator.divide

        //when
        let result = testoperator.calculate(lhs: 7, rhs: 2)

        //then
        XCTAssertEqual(result, 3.5)
    }

    func test_When_divide_by_zero_Expect_isNaN_true() {
        //given
        let testoperator = Operator.divide

        //when
        let result = testoperator.calculate(lhs: 7, rhs: 0)

        //then
        XCTAssertTrue(result.isNaN)
    }

    func test_When_multiply_opperator_Expect_lhs_multiply_rhs() {
        //given
        let testoperator = Operator.multiply

        //when
        let result = testoperator.calculate(lhs: 4, rhs: 5)

        //then
        XCTAssertEqual(result, 20)
    }

}
