import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: Test_result()
    func test_operands의_더한_값이_반환되는지() {
        // given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operators.enqueue("+")
        // when
        var result = 0.0
        do {
            result = try sut.result()
        } catch {
            print(CalculatorError.unknownError.errorMessage)
        }
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_0으로_나눌_때_에러가_반환되는지() {
        // given
        sut.operands.enqueue(0)
        sut.operands.enqueue(2)
        sut.operators.enqueue("/")
        // when
        var result = ""
        do {
            try sut.result()
        } catch {
            result = CalculatorError.dividedByZero.errorMessage
        }
        // then
        XCTAssertEqual(result, "NaN")
    }
}
