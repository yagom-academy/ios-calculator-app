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
        _ = sut.dequeue()
        //when
        let result = sut.showTail().data
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    // MARK: Test_reset()
    func testCalculateItems_요소가_다_삭제되는지() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.reset()
        //when
        let result = sut.showHead().data
        //then
        XCTAssertEqual(result, nil)
    }
    
    // MARK: Test_displayItems()
    func testCalculateItems에_추가한_요소가_다_보여지는지() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        //when
        let result = sut.displayItems()
        //then
        XCTAssertEqual(result, [1.0,2.0,3.0])
    }

    func testCalculateItems에_요소가_없을_때_빈배열을_반환하는지() {
        //given when
        let result = sut.displayItems()
        //then
        XCTAssertEqual(result, [])
    }

}
