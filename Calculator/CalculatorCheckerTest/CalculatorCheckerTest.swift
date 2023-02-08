import XCTest
@testable import Calculator

final class CalculatorCheckerTest: XCTestCase {

    private var sut: CalculatorChecker!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorChecker(updateClosure: { _ in })
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_appendingNumber호출시_값이존재하지않을때_1을넣는다면_enteringNumber가_1이다() {
        // given
        let input = "1"
        let expectation = "1"
        
        // when
        sut.appendingNumber(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingNumber호출시_값이존재할때_1을넣는다면_enteringNumber에_1이추가된다() {
        // given
        let input = "1"
        let expectation = "21"
        
        // when
        sut.appendingNumber("2")
        sut.appendingNumber(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingExpression호출시_enteringNumber가_3이고_빈값을_넣는다면_calculationExpression은_3이다() {
        // given
        let input = ""
        let expectation = "3"
        
        // when
        sut.appendingNumber("3")
        sut.appendingExpression(input)
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingExpression호출시_enteringNumber와_calculationExpression이_존재한다면_calculationExpression에_인자값과_enteringNumber가_추가된다() {
        // given
        let input = "+"
        let expectation = "1+2"
        
        // when
        sut.appendingNumber("1")
        sut.appendingExpression("")
        sut.appendingNumber("2")
        sut.appendingExpression(input)
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingExpression호출시_enteringNumber는_빈값이다() {
        // given
        let input = ""
        let expectation = ""
        
        // when
        sut.appendingExpression(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingZero호출시_enteringNumber가_0이라면_enteringNumber에_0이추가되지않는다() {
        // given
        let input = "0"
        let expectation = "0"
        
        // when
        sut.appendingNumber("0")
        sut.appendingZero(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingZero호출시_enteringNumber가_유효숫자일때_zeroPad를추가한다() {
        // given
        let input = "0"
        let expectation = "10"
        
        // when
        sut.appendingNumber("1")
        sut.appendingZero(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingDot호출시_enteringNumber에_값이_있다면_닷이_추가된다() {
        // given
        let expectation = "2."
        
        // when
        sut.appendingNumber("2")
        sut.appendingDot()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingDot호출시_enteringNumber값이_없다면_0과_닷이_추가된다() {
        // given
        let expectation = "0."
        
        // when
        sut.appendingDot()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendingDot호출시_enteringNumber값에_dot이_포함된다면_값이_변하지않는다() {
        // given
        let expectation = "0.1"
        
        // when
        sut.appendingDot()
        sut.appendingNumber("1")
        sut.appendingDot()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_changedSign호출시_현재_값이_양수라면_음수가_된다() {
        // given
        let input = "3"
        let expectation = "-3"
        
        // when
        sut.appendingNumber(input)
        sut.changeSign()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_changedSign호출시_현재_값이_음수라면_양수가_된다() {
        // given
        let input = "3"
        let expectation = "3"
        
        // when
        sut.appendingNumber(input)
        sut.changeSign()
        sut.changeSign()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_initialState호출시_입력한연산식들이_초기화된다() {
        // given
        let operandInput = "3"
        let operatorInput = "+"
        let expectation = Sign.empty
        
        // when
        sut.appendingNumber(operandInput)
        sut.appendingExpression(operatorInput)
        sut.initialState()
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_initialEnteringNumber호출시_EnteringNumber는_값이_비워진다() {
        // given
        let input = "324"
        let expectation = Sign.empty
        
        // when
        sut.appendingNumber(input)
        sut.initialEnteringNumber()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_initialEnteringNumber호출시_calculationExpression은_남아있다() {
        // given
        let operandInput = "324"
        let operatorInput = "+"
        let expectation = operatorInput + operandInput
        
        // when
        sut.appendingNumber(operandInput)
        sut.appendingExpression(operatorInput)
        sut.initialEnteringNumber()
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate호출시_enteringNumber값이_비워진다() {
        // given
        let operandInputs = ["123", "456"]
        let operatorInput = "+"
        let expectation = Sign.empty
        
        // when
        sut.appendingNumber(operandInputs[0])
        sut.appendingExpression(operatorInput)
        sut.appendingNumber(operandInputs[1])
        sut.calculate()
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
