import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    // MARK: Setting
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: Test_enqueue()
    func testCalculateItems에_요소가_잘_추가되는지() {
        //given
        sut.enqueue(1.0)
        //when
        let result = sut.showHead().data
        //then
        XCTAssertEqual(result, 1.0)
    }
}
