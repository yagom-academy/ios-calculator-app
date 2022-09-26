//  Created by Aejong on 2022/09/27.

struct Formula {
    let operands: CalculatorItemQueueByLinkedList<Any>
    let operators: CalculatorItemQueueByLinkedList<Any>
    
    func result() -> Double {
        return 0
    }
}
