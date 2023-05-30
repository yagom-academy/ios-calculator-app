//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hyungmin Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {

    var systemUnderTest: CalculateItem!
    
    override func setUpWithError() throws {
        systemUnderTest = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

}
