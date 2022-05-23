import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    func test_result_1더하기2곱하기3빼기4는5가나오는지() {
        // given
        let operands = CalculatorItemQueue<Double>.init(list: [1, 2, 3, 4])
        let operators = CalculatorItemQueue<Operator>.init(list: [Operator.add, Operator.multiply, Operator.subtract])
        var formula = Formula(operands: operands, operators: operators)
        let expectation: Double = 5
        
        // when
        let result = try? formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_비어있는formula면에러를보내는지() {
        // given
        var formula = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        
        // when
        let result = try? formula.result()
        
        // then
        XCTAssertNil(result)
    }
}
