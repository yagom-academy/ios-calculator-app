//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/5/24.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem where Element: Equatable { // Element 가 '==' 지원하도록 보장
    // 인스턴스를 만들어서 속성에 저장하는 방식
    // 노드와 다른 노드가 포인터로 연결되어 있기 때문에 class 선언
    class Node { // Nested Type(중첩유형) : 다른 유형 내에 정의된 유형(클래스, 구조체, 열거형), 캡슐화 가능, 네임스페이스 명확성, 컨텍스트 관련성
        var value: Element
        var next: Node? // 다음 노드가 반드시 존재하는 것은 아니므로 옵셔널
        
        // 생성자 추가
        init(value: Element) {
            self.value = value // 본사본이 아닌 참조가 저장
        }
        
        deinit { // 소멸자 추가
            print(value, #function)
        }
    }
    
    var head: Node?
    var tail: Node?
    
    // 노드를 순회하는 방식으로 구현
    var count: Int {
        guard head != nil else { return 0 }
        
        var cnt = 0 // 노드를 순회할 때마다 1씩 증가
        var current = head
        
        repeat {
            cnt += 1
            current = current?.next // 다음 노드로 이동
        } while current != nil // nil이 아닐 때 까지 반복
        
        return cnt
    }
    
    var isEmpty: Bool {
        return head == nil // 헤드를 적절하게 업데이트 하는 게 중요해짐
    }
    
    // 컬렉션 속성에서 요소를 추가하거나 제거하는 등 구조체의 속성을 수정하는 모든 작업에는 메서드가 mutating으로 표시
    mutating func enqueue(_ element: Element) {
        let newNode = Node(value: element)
        
        if tail != nil { // tail 은 큐가 비어 있는 경우 nil 을 반환하는 계산된 속성이므로 래핑 헤제를 할 필요가 없다. 직접 확인이 가능하다.
            tail?.next = newNode
        } else {
            head = newNode
        }
        
        // 정확한 테일 참조 유지: 'tail'을 업데이트하지 않으면 각 인큐 작업은 마지막 노드를 찾기 위해 전체 목록을 순회해야 하며, 이로 인해 인큐 작업은 시간 복잡도가 O(n)
        // 후속 작업의 효율성: 큐 데이터 구조는 FIFO(선입선출) 원칙에 따라 작동. 이 원칙을 준수하려면 대기열의 시작(머리)과 끝(꼬리)을 모두 아는 것이 중요
        
        tail = newNode
        
        // 큐가 처음에 비어 있는 경우: head와 tail 모두 새 노드로 설정됩니다. 이는 새 노드가 대기열의 첫 번째 요소이자 마지막 요소
        // 큐가 비어 있지 않은 경우: 현재 tail 노드의 next 속성이 새 노드를 가리키도록 설정하여 새 노드가 큐 끝에 추가됨. 'tail'이 이 새 노드로 업데이트되어 이제 대기열의 마지막 요소임을 반영
    }
    
    mutating func dequeue() -> Element? {
        guard let headNode = head else { return nil }
        head = headNode.next
        
        if head == nil {
            tail = nil
        }
        
        return headNode.value
    }
    
    mutating func prepend(_ element: Element) {
        let newNode = Node(value: element)
        newNode.next = head
        head = newNode
    }
    
    mutating func insert(_ element: Element, before node: Node) {
        let newNode = Node(value: element)
        
        // 이전 노드가 없는 경우
        if node === head { // 항등연산자
            prepend(element)
        } else {
            // 이전 노드 파악
            var prev: Node? = nil
            var current = head
            
            while current !== node {
                prev = current
                current = current?.next
            }
            
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }
    
    func first(matching value: Element) -> Node? { // 검색이 안돼면 결과가 없으니 옵셔널 타입
        var current = head
        
        while let node = current {
            if node.value == value {
                return node
            }
            current = current?.next
        }
        
        return nil
    }
    
    mutating func remove(node: Node) {
        var prevNode = head
        
        if prevNode === node {
            head = node.next
        } else {
            while let next = prevNode?.next {
                if next === node {
                    prevNode?.next = node.next
                    return
                }
                
                prevNode = next
            }
        }
    }
    
    mutating func removeAll() {
        head = nil
    }
    
    func printNode() {
        var currentNode = head
        
        while let node = currentNode { // while let 을 이용하여 currentNode를 안전하게 푼다 = 강제 언래핑이 필요하지 않게 된다.
            print(node.value, terminator: " -> ")
            currentNode = node.next // currentNode가 nil이 될 때까지 각 노드에 대한 반복을 안전하게 처리한다.
        }
        print()
    }
}
