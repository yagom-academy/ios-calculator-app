import XCTest

final class FormulaTests: XCTestCase {
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기2나누기3곱하기4의_결과값이4가나오는지_확인하는함수() {
        // given
        let inputOperands: [Double] = [1,2,3,4]
        let inputOperators: [Operator] = [.add, .divide,.multiply]
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: inputOperands)
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: inputOperators)
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let resultValue = sut.result()
        let expectedValue:Double = 4
        
        // then
        XCTAssertEqual(resultValue, expectedValue)
        
    }

}
