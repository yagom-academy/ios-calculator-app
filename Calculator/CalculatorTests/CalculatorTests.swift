

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
    
    func test_0만_있는_노드에_1추가() {
        sut.enqueue(in: "1")
        XCTAssertEqual(sut.head?.pointer?.data, Optional("1"))
    }
    
//    func test_LinkedList의_새로운_노드_추가() {
//        sut.enqueue(in: "2")
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
//    }
//
}

