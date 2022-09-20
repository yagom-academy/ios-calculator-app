//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/20.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var front: Node<T>?
    var rear: Node<T>?
    
    func isCheckEmpty() -> Bool {
        if front == nil {
            return true
        } else {
            return false
        }
    }
    
    mutating func enQueue(_ item: T) {
        let newNode: Node<T>? = Node(data: item)
        
        if isCheckEmpty() {
            front = newNode
            rear = newNode
        } else {
            rear?.link = newNode
            rear = newNode
        }
    }
    
    mutating func deQueue() -> T? {
        if !isCheckEmpty() {
//            let old = front
            guard let item = front?.data else { return nil }
            front = front?.link
            if isCheckEmpty() {
                rear = nil
            }
            // 여기서 old가 가리키는 노드를 메모리에서 삭제하고싶은데 어떻게 해야할지 잘 모르겠습니다.
            
            return item
        } else {
            print("비어있습니다")
            return nil
        }
    }
}

//계산기가 입력받은 숫자와 연산자는 연산큐에 쌓입니다.
//사칙연산 계산을 위한 큐(Queue) 타입(CalculatorItemQueue)과 큐타입 구현을 위한 List 타입을 직접 UML로 표현해봅니다.
//CalculatorItemQueue를 코드로 구현합니다.
//CalculatorItemQueue의 내부구현은 자율로 합니다.
//CalculatorItemQueue에서 다루는 요소는 CalculateItem 프로토콜을 준수합니다.
//CalculateItem 프로토콜은 빈 프로토콜입니다.
//CalculatorItemQueue의 내부에서 사용하는 List 형식의 자료구조를 직접 구현해보고 싶다면 List 자료구조를 구현해봐도 좋습니다(선택사항)
