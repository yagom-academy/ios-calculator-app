//
//  Extension.swift
//  Calculator
//  
//  Created by Christy Lee on 2023/01/30.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let components = components(separatedBy: String(target))
        return components
    }
}
