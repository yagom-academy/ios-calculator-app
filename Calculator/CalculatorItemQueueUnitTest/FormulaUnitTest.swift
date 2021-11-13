import XCTest

class FormulaUnitTest: XCTestCase {
    var numbers: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
//    var formula: Formula!
    
    override func setUpWithError() throws {
        numbers = CalculatorItemQueue<Double>(calculatorItems: [])
        operators = CalculatorItemQueue<Operator>(calculatorItems: [])
//        formula = Formula(operands: numbers, operators: operators)
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

        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

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

        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

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

        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 6)

    }
    
    func test_2더하기_3곱하기_4의_결과는_9가_나온다() {
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(4)
        
        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.multiply)
        
        var formula = Formula(operands: numbers, operators: operators)
        
        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_2더하기_3곱하기_4빼기_5의_결과는_15가_나온다() {
        //given
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(4)
        numbers.enqueue(5)
        
        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.multiply)
        operators.enqueue(.subtract)
        
        var formula = Formula(operands: numbers, operators: operators)
        
        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 15)
    }
    
    func test_2더하기_3나누기_0은_에러가_난다() {
        //given
        numbers.enqueue(2)
        numbers.enqueue(3)
        numbers.enqueue(0)
        
        operators.enqueue(.add)
        operators.enqueue(.add)
        operators.enqueue(.divide)
        
        var formula = Formula(operands: numbers, operators: operators)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertNoThrow(result)
    }
}


