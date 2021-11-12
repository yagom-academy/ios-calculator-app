import XCTest

class FormulaUnitTest: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_2더하기_3더하기_4의_결과는_9가_나온다() {
        //given
        var numbers = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(4)
        operators.enqueue(.add)
        operators.enqueue(.add)
        
        var firstFormula = Formula(operands: numbers, operators: operators)
        
        //when
        let result = firstFormula.result()
        
        //then
        XCTAssertEqual(result, 9)
    }

}


