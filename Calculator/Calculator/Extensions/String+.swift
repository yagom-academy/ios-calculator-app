//
//  String+.swift
//  Created by 미니.
//

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target, omittingEmptySubsequences: false).map { $0.description }
    }
}

extension Character {
    var isNumber: Bool {
        return Double(String(self)) != nil ? true: false
    }
}
