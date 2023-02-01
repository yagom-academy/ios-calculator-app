import XCTest

final class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_1더하기2빼기3곱하기4로입력된값을_parse에넣으면_각각연산자와_피연산자로_나누어진다() {
        // given
        let input = "1+2-3*4"
        let inputOperand: Array<Double> = [1,2,3,4]
        let inputOperator = [Operator.add, Operator.subtract, Operator.multiply]
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let resultOperand = formula.operands.enqueueStack
        let resultOperator = formula.operators.enqueueStack
        
        // then
        XCTAssertEqual(inputOperand, resultOperand)
        XCTAssertEqual(inputOperator, resultOperator)
    }
    

}
