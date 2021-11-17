//
//  DummyItem.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/10.
//

import XCTest
@testable import Calculator

enum DummyItem: Equatable, CalculateItem {
    case number(value: Int)
    case symbol(value: String)
}
