import XCTest

class CalculatorTests: XCTestCase {

    func test_빈큐에_delete를_하면_에러발생() {
        let cal = CalculatorItemQueue<Double>()
        try? cal.deleteFromQueue()
        XCTAssertNoThrow(ErrorCase.emptyQueue)
    }
    
    
}
