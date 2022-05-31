import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_result()
    func test_operands의_더한_값이_반환되는지() {
        // given
        sut = Formula()
        sut.operands.enqueue(5)
        sut.operands.enqueue(4)
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.add)
        // when
        let result = try? sut.result()
        // then
        XCTAssertEqual(result, 8)
    }
    
    func test_0으로_나눌_때_에러넘버가_반환되는지() {
        // given
        sut = Formula()
        sut.operands.enqueue(0)
        sut.operands.enqueue(2)
        sut.operators.enqueue(Operator.divide)
        // when
        // given
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_0으로_나눌_때_에러메세지가_출력되는지() {
        // given
        sut = Formula()
        sut.operands.enqueue(0)
        sut.operands.enqueue(2)
        sut.operators.enqueue(Operator.divide)
        // when
        var result = ""
        do {
            var _ = try sut.result()
        } catch CalculatorError.dividedByZero {
            result = CalculatorError.dividedByZero.errorMessage
        } catch {
            result = CalculatorError.unknownError.errorMessage
        }
        // given
        XCTAssertEqual(result, "NaN")
    }
    
    func test_0으로_나눌_때_에러메세지가_출력되는지2() {
        // given
        sut = Formula()
        sut.operands.enqueue(5)
        sut.operands.enqueue(4)
        sut.operands.enqueue(0)
        sut.operands.enqueue(3)
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.add)
        // when
        var result = 0.0
        
        do {
            result = try sut.result()
        } catch CalculatorError.dividedByZero {
            _ = CalculatorError.dividedByZero.errorMessage
        } catch {
            _ = CalculatorError.unknownError.errorMessage
        }
        // given
        XCTAssertNotEqual(result, 20.0)
    }
}
