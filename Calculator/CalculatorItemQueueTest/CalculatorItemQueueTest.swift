import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    //MARK: - count
    func test_count호출시_dequeue호출전_enqueueList의개수가정상적으로반환되는지() {
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        let result = sut.count
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_count호출시_dequeue호출후_dequeueList의개수가정상적으로반환되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        sut.dequeue()
        let result = sut.count
        //then
        XCTAssertEqual(result, 2)
    }
    //MARK: - first, last
    func test_enqueueList에요소가있고dequeueList는비어있을때_fist와last가정상적으로값을반환하는지() {
        //given
        let input: Double = 3
        let input2: Double = 6
        let input3: Double = 31
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        //then
        XCTAssertEqual(sut.first, input)
        XCTAssertEqual(sut.last, input3)
    }
    
    func test_enqueueList는비어있고dequeueList는요소가있을때_fist와last가정상적으로값을반환하는지() {
        //given
        let input: Double = 4
        let input2: Double = 12
        let input3: Double = 43
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        sut.dequeue()
        //then
        XCTAssertEqual(sut.first, input2)
        XCTAssertEqual(sut.last, input3)
    }

    func test_enqueueList와dequeueList둘다요소가있을때_first와last를정상적으로반환하는지() {
        //given
        let input: Double = 5
        let input2: Double = 41
        let input3: Double = 1
        let input4: Double = 6
        let input5: Double = 8
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        sut.dequeue()
        sut.enqueue(input4)
        sut.enqueue(input5)
        //then
        XCTAssertEqual(sut.first, input2)
        XCTAssertEqual(sut.last, input5)
    }
    
    //MARK: - isEmpty
    func test_isEmpty호출시_리스트들이비어있을때_true를반환하는지() {
        //when
        sut.removeAll()
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_isEmpty호출시_enqueueList만요소가있을때_false를반환하는지() {
        //when
        sut.enqueue(1)
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_isEmpty호출시_dequeueList만요소가있을때_false를반환하는지() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_isEmpty호출시_두리스트다요소가있을때_false를반환하는지() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        sut.enqueue(123)
        //then
        XCTAssertFalse(sut.isEmpty)
        
    }
    //MARK: - enqueue()
    func test_enqueue호출시_정상적으로추가가되는지() {
        //given
        let input: Double = 2
        let input2: Double = 4
        let input3: Double = 7
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        //then
        XCTAssertEqual(sut.first, input)
        XCTAssertEqual(sut.last, input3)
    }
    //MARK: - dequeue()
    func test_dequeue호출시_FIFO가정상적으로진행되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        
        let firstOut = sut.dequeue()
        let secondOut = sut.dequeue()
        let thirdOut = sut.dequeue()
        //then
        XCTAssertEqual(firstOut, input)
        XCTAssertEqual(secondOut, input2)
        XCTAssertEqual(thirdOut, input3)
    }
    
    func test_dequeue호출시_배열이비어있을때_nil을반환하는지() {
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
    //MARK: - removeAll()
    func test_removeAll호출시_전부삭제되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        let preCount = sut.count
        sut.removeAll()
        let result = sut.count
        //then
        XCTAssertEqual(preCount, 3)
        XCTAssertEqual(result, 0)
    }
}
