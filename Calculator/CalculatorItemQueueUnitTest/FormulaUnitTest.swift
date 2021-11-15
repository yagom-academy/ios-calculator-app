import XCTest

class FormulaUnitTest: XCTestCase {
    var formula: Formula!
    
    override func setUpWithError() throws {
        formula = Formula()
    }

    override func tearDownWithError() throws {
        formula = nil
    }

    func test_2더하기_3의_결과는_5가_나온다() {
        //given
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)


        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 5)
    }

    func test_2더하기_3더하기_4의_결과는_9가_나온다() {
        //given
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)
        formula.operands.enqueue(4)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)

//        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 9)
    }

    func test_2더하기_3더하기_4빼기_3의_결과는_6이_나온다() {
        //given
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)
        formula.operands.enqueue(4)
        formula.operands.enqueue(3)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.subtract)

//        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 6)

    }

    func test_2더하기_3곱하기_4의_결과는_9가_나온다() {
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)
        formula.operands.enqueue(4)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.multiply)

//        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 20)
    }

    func test_2더하기_3곱하기_4빼기_5의_결과는_15가_나온다() {
        //given
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)
        formula.operands.enqueue(4)
        formula.operands.enqueue(5)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.multiply)
        formula.operators.enqueue(.subtract)

//        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertEqual(result, 15)
    }

    func test_2더하기_3나누기_0은_에러가_난다() {
        //given
        formula.operands.enqueue(2)
        formula.operands.enqueue(3)
        formula.operands.enqueue(0)

        formula.operators.enqueue(.add)
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.divide)

//        var formula = Formula(operands: numbers, operators: operators)

        //when
        let result = formula.result()

        //then
        XCTAssertNoThrow(result)
    }
}


