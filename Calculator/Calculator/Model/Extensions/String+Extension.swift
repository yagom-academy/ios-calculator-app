//
//  String+Extension.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//
extension String {
	func split(with target: Character) -> [String] {
		return self.split(separator: target).map { String($0) }
	}
}
