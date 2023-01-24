//  CalculatorItemQueue.swift
//  Created by 레옹아범 on 2023/01/24.

struct CalculatorItemQueue: CalculateItem {
    var items = Queue()
    var item: String = ""
    
    mutating func removeAllItems() {
        self.items.removeAll()
        self.item = ""
    }
    
    mutating func removeNowItem() {
//        2+3-4+5를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
//        2+3-4+ 를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
//        2+3-4+5= 을 입력하고 CE를 누르면 0의 상태가 됩니다.
    }
    
    mutating func reverseSign() {
//        ⁺⁄₋ 버튼은 현재 입력한 숫자의 부호를 변환합니다.
//        입력된 숫자가 0인경우 부호를 표시하지 않고 변경하지도 않습니다.
    }
    
    mutating func finishInputItem() {
//        숫자입력 중에 연산자(÷, ×, -, +)를 누르게 되면 숫자입력을 중지하고 다음 숫자를 입력받습니다.
        if item == "" {
            return
        }
        
        let tempNode = Node(value: item)
        self.items.enqueue(tempNode)
    }
    
    mutating func addNumber(_ number: String) {
//        현재 숫자입력이 없는 상태인 0에서는 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다.
//        현재 숫자입력이 없는 상태인 0에서는 연산자의 종류만 변경합니다.
        self.item += number
    }
    
    mutating func caculateItems() {
//        = 버튼을 누르면 입력된 연산을 한 번에 수행합니다.
    }
}
