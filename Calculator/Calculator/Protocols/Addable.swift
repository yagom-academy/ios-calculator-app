//
//  AddableProtocol.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

protocol Addable {
    associatedtype T
    
    func add(_ operatedNumber: T, and operatingNumber: T)
}

extension Addable {
    func add(_ operatedNumber: T, and operatingNumber: T) {
        
    } 
}


