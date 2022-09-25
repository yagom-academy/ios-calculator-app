//
//  String+.swift
//  Created by 미니.
//

extension String {
    func split(with target: Character) -> [String] {
        return replacingOccurrences(of: String(target), with: " ").map { $0.description }
    }
}
