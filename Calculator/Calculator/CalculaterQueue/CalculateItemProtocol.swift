//
//  CalculateItem.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

protocol CalculateItemProtocol {
    associatedtype Element
    
    /// 큐 끝에 새로운 큐를 추가하고 성공여부 반환
    mutating func enQueue(_ element: Element) -> Bool

    /// 가장 먼저 들어온 앞의 큐 제거하고 제거한 큐 반환
    mutating func deQueue() throws -> Element
    
    /// 큐가 비우는 함수
    mutating func removeAll() throws
    
    /// 큐가 비어있는지 알려주는 읽기전용 프로퍼티
    var isEmpty: Bool { get }
    
    /// 큐의 제일 처음 값을 가짐
    var peek: Element? { get }
}
