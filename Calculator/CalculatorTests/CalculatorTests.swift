
import XCTest

class CalculatorTests: XCTestCase {
    
    func test_헤드가_비었는지() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        let boolean = sut.linkedList.isEmpty
        
        XCTAssertFalse(boolean)
    }
    
    func test_0만_있는_노드에_1추가한_후_데이터를_출력하면_1이나온다() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        sut.linkedList.enqueue("1")
        XCTAssertEqual(sut.linkedList.head!.pointer!.data, "1")
    }
    
    func test_LinkedList의_새로운_노드_추가하면_정상적으로_2가_출력() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        sut.linkedList.enqueue("2")
        XCTAssertEqual(sut.linkedList.head!.pointer!.data, "2")
    }
    
    func test_첫번째_노드를_Dequeue하면_nil인가() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        sut.linkedList.dequeue()
        XCTAssertNil(sut.linkedList.head?.pointer)
    }
    
    func test_Head만_있는_노드에_하나추가_후_dequeue하면_nil인가() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        sut.linkedList.enqueue("1")
        XCTAssertNil(sut.linkedList.head!.pointer!.pointer)
    }
    
    func test_1과2가_있는_노드에서_dequeue하면_2가남는다() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("1")
        sut.linkedList.enqueue("2")
        sut.linkedList.dequeue()
        XCTAssertEqual(sut.linkedList.head!.data, "2")
        XCTAssertNil(sut.linkedList.head?.pointer)
    }
    
    func test_Head인0만있는_리스트에_dequeue_2번하면_nil인가() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        XCTAssertEqual(sut.linkedList.head!.data, "0")
        sut.linkedList.dequeue()
        XCTAssertNil(sut.linkedList.head?.data)
        sut.linkedList.dequeue()
        XCTAssertNil(sut.linkedList.head?.data)
    }
    
    func test_값이_존재하는_Queue의_head를_끊어서_초기화() {
        let sut = CalculatorItemQueue<String>()
        sut.linkedList.enqueue("0")
        XCTAssertFalse(sut.linkedList.head?.data == nil)
        sut.linkedList.cleanQueue()
        XCTAssertNil(sut.linkedList.head?.data)
    }
    
}


