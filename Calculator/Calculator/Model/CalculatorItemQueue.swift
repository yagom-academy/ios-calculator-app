//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//


protocol CalculateItem {
	
}

struct CalculatorItemQueue: CalculateItem {
	private var elements: [Int] = []
	
	mutating func addElement(_ value: Int) {
		elements.append(value)
	}
}
