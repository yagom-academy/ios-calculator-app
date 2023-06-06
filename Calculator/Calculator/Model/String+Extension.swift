//
//  String+Extension.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

import Foundation

extension String {
	func split(with target: Character) -> [String] {
		let splitByTarget = self.split(separator: target)
		let result = splitByTarget.map { String($0) }

		return result
	}
}
