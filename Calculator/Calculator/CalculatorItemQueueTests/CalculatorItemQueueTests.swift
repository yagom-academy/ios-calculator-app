import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue가_비어있을때_true를_반환하는가() {
        //given
        let queue = CalculatorItemQueue<Double>()
        //when
        let result = queue.isEmpty
        //then
        XCTAssertEqual(result, true)
    }
}

