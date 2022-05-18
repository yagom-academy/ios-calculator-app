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
    
    func testCalculateItems에_요소가_연속으로_추가되는지() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        //when
        let result = sut.showHead().next?.data
        //then
        XCTAssertEqual(result, 2.0)
    }
    
    // MARK: Test_dequeue()
    func testCalculateItems의_마지막_요소가_삭제되는지() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.dequeue()
        //when
        let result = sut.showHead().next?.data
        //then
        XCTAssertEqual(result, nil)
    }
}
