import XCTest

class FormulaUnitTest: XCTestCase {
    var numbers: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        numbers = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        numbers = nil
        operators = nil
    }

    func test_2더하기_3의_결과는_5가_나온다() {
        //given
        numbers.enqueue(2)
        numbers.enqueue(3)

        operators.enqueue(.add)
        operators.enqueue(.add)

        var firstFormula = Formula(operands: numbers, operators: operators)

        //when
        let result = firstFormula.result()

        //then
        XCTAssertEqual(result, 5)
    }

    func test_2더하기_3더하기_4의_결과는_9가_나온다() {
        //given
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(4)

        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.add)

        var secondFormula = Formula(operands: numbers, operators: operators)

        //when
        let result = secondFormula.result()

        //then
        XCTAssertEqual(result, 9)
    }

    func test_2더하기_3더하기_4빼기_3의_결과는_6이_나온다() {
        //given
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(4)
        numbers.enqueue(3)
        
        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.subtract)

        var thirdFormula = Formula(operands: numbers, operators: operators)

        //when
        let result = thirdFormula.result()

        //then
        XCTAssertEqual(result, 6)

    }

}


