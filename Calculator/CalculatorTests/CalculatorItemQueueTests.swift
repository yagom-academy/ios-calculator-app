//  CalculatorTests.swift
//  Created by zhilly and Gundy on 2022/10/04.

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue를_Double타입으로_빈queue생성할때_Error가안나고_isEmpty가true인지(){
        //given
        let queue = CalculatorItemQueue<Double>()
        
        //when
        
        //then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_queue에_값을enqueue했을때_isEmpty가False인지() {
        //given
        let element: Double = 3
        
        //when
        sut.enqueue(element)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에_3을enqueue했을때_isEmpty가false인지() {
        //given
        let element: Double = 3
        
        //when
        sut.enqueue(element)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에_3_6_9를enqueue했을때_isEmpty가False인지() {
        //given
        let elementArray: [Double] = [3, 6, 9]
        
        //when
        for element in elementArray {
            sut.enqueue(element)
        }
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에_3_6_9를enqueue하고dequeue을한번했을때_dequeue된요소가맨앞의값_3과같은값인지() {
        //given
        let elementArray: [Double] = [3, 6, 9]
        
        //when
        for element in elementArray {
            sut.enqueue(element)
        }
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_queue에dequeue할요소가없을때_nil값을반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에3_6_9를enqueue하고queue의count보다많은dequeue을했을때_결과가nil이나오는지() {
        //given
        let elementArray: [Double] = [3, 6, 9]
        
        //when
        for element in elementArray {
            sut.enqueue(element)
        }
        
        var result: Double?
        for _ in 0...sut.count {
            result = sut.dequeue()
        }
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에1_2_3_4_5를enqueue했을때count값이5인지() {
        //given
        let elementArray: [Double] = [1, 2, 3, 4, 5]
        
        //when
        for element in elementArray {
            sut.enqueue(element)
        }
        let result = sut.count
    
        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_queue가비어있을때count가0인지() {
        //given
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 0)
    }
}
