//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hyungmin Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {

    var systemUnderTest: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        systemUnderTest = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

    func test_3을_enqueue했을때_queue의Element를_확인한다() {
        
    }
    
    func test_3_4를_enqueue했을때_queue의Element를_확인한다() {
        
    }
    
    func test_3_4_5_를_enqueue했을때_queue의Element를_확인한다() {
        
    }
}
