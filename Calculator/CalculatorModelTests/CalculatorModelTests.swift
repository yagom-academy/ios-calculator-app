//  Created by Aejong on 2022/09/21.


import XCTest
@testable import Calculator

class CalculatorModelTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_enqueue가없었을때_count가0을반환하는지() {
        // given
        sut.queue = []
        
        // when
        let result: Int = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_queue의요소가하나만주어지고_dequeue했을때_count가0을반환하는지() {
        // given
        sut.queue = ["1"]
        
        // when
        sut.queue.removeFirst()
        let result: Int = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    
    func test_queue에아무요소도없을때_isEmpty변수가true를반환하는지() {
        // given
        sut.queue = []
        
        // when
        let result: Bool = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_배열의요소_1_더하기연산자_3들을_enqueue해줬을때_순서에맞게queue에append되는지() {
        // given
        let input = ["1", "+", "3"]
        
        // when
        for element in input {
            sut.enqueue(element)
        }
        
        // then
        XCTAssertEqual(sut.queue, ["1", "+", "3"])
    }
    
    func test_queue에_1_더하기연산자_3이주어지고_dequeue해줬을때_queue에서1이사라지는지() {
        // given
        sut.queue = ["1", "+", "3"]
        
        // when
        let result: String? = sut.dequeue()
        
        // then
        XCTAssertEqual(result, "1")
        XCTAssertEqual(sut.queue, ["+", "3"])
    }
}
