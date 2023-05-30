//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kangkyungmin on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue타입이_있는지_확인() {
        //given
        let queue:CalculatorItemQueue?
        //when
        queue = CalculatorItemQueue()
        //then
        XCTAssertNotNil(queue)
    }
    
    func test_CalculatorItemQueue타입이_CalculateItem프로토콜을_준수하고_있는지_확인() {
        //given
        let queue = CalculatorItemQueue()
        //when,then
        var queueProtocol = try? queue as? CalculateItem
        //then
        XCTAssertNotNil(queueProtocol)
    }
}
