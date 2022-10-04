//  Created by Aejong on 2022/09/23.

class LinkedListNode<T> {
    let value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        print("\(self.value)가 메모리에서 해제됨")
    }
}
