//
//  String+.swift
//  Created by 미니.
//

extension String {
    func split(with target: Character) -> [String] {
        let target: String = " \(target) "
        return replacingOccurrences(of: target, with: " ").map { $0.description }
    }
}
