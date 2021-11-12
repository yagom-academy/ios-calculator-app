

import XCTest

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>(head: Node(data: "0", pointer: nil))
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_헤드가_비었는지() {
        let boolean = sut.isEmpty
        
        XCTAssertFalse(boolean)
    }
    
    func test_0만_있는_노드에_1추가한_후_데이터를_출력하면_1이나온다() {
        sut.enqueue(in: "1")
        XCTAssertEqual(sut.head!.pointer!.data, "1")
    }
    
    func test_LinkedList의_새로운_노드_추가하면_정상적으로_2가_출력() {
        sut.enqueue(in: "2")
        XCTAssertEqual(sut.head!.pointer!.data, "2")
    }
    
    func test_첫번째_노드를_Dequeue하면_nil인가() {
        sut.dequeue()
        XCTAssertNil(sut.head?.pointer)
    }
    
    func test_Head만_있는_노드에_하나추가_후_dequeue하면_nil인가() {
        sut.enqueue(in: "1")
        XCTAssertNil(sut.head!.pointer!.pointer)
    }
    
    func test_1과2가_있는_노드에서_dequeue하면_2가남는다() {
        sut = CalculatorItemQueue(head: Node(data: "1", pointer: Node(data: "2", pointer: nil)))
        sut.dequeue()
        XCTAssertEqual(sut.head!.data, "2")
        XCTAssertNil(sut.head?.pointer)
    }
    
    func test_Head인0만있는_리스트에_dequeue_2번하면_nil인가() {
        XCTAssertEqual(sut.head!.data, "0")
        sut.dequeue()
        XCTAssertNil(sut.head?.data)
        sut.dequeue()
        XCTAssertNil(sut.head?.data)
    }
    
    func test_dequeueWithdata_실행시_0이_제대로_나오는지() {
        var dataOfdeque = sut.dequeueWithData()
        XCTAssertTrue(sut.head?.data == nil)
        XCTAssertEqual(dataOfdeque, "0")
    }
    
    func test_빈_리스트에_dequeueWithData_를_하면_nil이_나오는지() {
        var dataOfDefaultHead = sut.dequeueWithData()
        XCTAssertEqual(dataOfDefaultHead, "0")
        XCTAssertNil(sut.dequeueWithData())
    }
    
    func test_값이_존재하는_Queue의_head를_끊어서_초기화() {
        XCTAssertFalse(sut.head?.data == nil)
        sut.cleanQueue()
        XCTAssertNil(sut.head?.data)
    }
    
}


