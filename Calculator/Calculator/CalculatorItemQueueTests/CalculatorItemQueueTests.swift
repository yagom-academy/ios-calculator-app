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
    
    func test_CalculatorItemQueue가_비어있을때_isEmpry는_true를_반환하는가() {
        //given
        sut.enqueueStack = []
        sut.dequeueStack = []
        //when
        let result = sut.isEmpty
        //then
        XCTAssertEqual(result, true)
    }
    
    func test_CalculatorItemQueue가_비어있지않을때_isEmpry는_false를_반환하는가() {
        //given
        sut.enqueueStack = [1, 2, 3]
        sut.dequeueStack = []
        //when
        let result = sut.isEmpty
        //then
        XCTAssertEqual(result, false)
    }
    
    func test_enqueue를_통해_새로운_Element를_추가할수있는가() {
        //given
        let value = 10.0
        //when
        sut.enqueue(value)
        //then
        XCTAssertNotNil(sut.enqueueStack)
    }
    
    func test_dequeue를_통해_Element가_나오는가() {
        //given
        sut.enqueue(10.0)
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, 10.0)
    }
    
    func test_Stack에_여러개가_쌓여도_dequeue를_통해_Element가_잘나오는가() {
        //given
        sut.enqueue(10.0)
        sut.enqueue(11.0)
        //when
        var result = sut.dequeue()
        result = sut.dequeue()
        //then
        XCTAssertEqual(result, 11.0)
    }
}

