//
//  Extension.swift
//  Calculator
//  
//  Created by Christy, Muri on 2023/01/30.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let components = components(separatedBy: String(target))
        
        return components
    }
}
