# 계산기


## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
사용자로부터 UI 입력을 받아 계산기 동작을 수행하는 프로그램입니다.

* 주요 개념: `UIKit`, `Outlet/Action`, `OOP`, `SOLID`, `Queue`, `Linked-List`

</br>

## 👨‍💻 팀원
| Zion |
| :--------: |
|<Img src= "https://hackmd.io/_uploads/rJqMfSoVn.png" width="200" height="200"> |
|[Github Profile](https://github.com/LeeZion94) |

## 👀 시각화된 프로젝트 구조


### Diagram
![UML](UML.png)
</br>

## 💻 실행 화면 



</br>

## 🧨 트러블 슈팅

1️⃣ 시간복잡도 <br>
-
🔒 **문제점** <br>
`Queue`를 구현할 수 있는 자료구조`(Array, DoubleStack, Linked-List)` 중 어떤 자료구조를 선택하여 `Queue`를 구현했을 때의 시간복잡도가 제일 낮을 수 있는지 고민했습니다.
`enqueue`와 `dequeue` 중 둘중 한개의 기능이 `O(n)`을 가지고 있기 때문에 `enqueue`와 `dequeue` 모두 `O(1)`로 가지는 자료구조를 구현하고자 했습니다.

🔑 **해결방법** <br>
[DoubleStack vs Linked-List 정리 자료](https://medium.com/@LeeZion94/linked-list-vs-double-stack-big-o-9fbc1624c240)
`Double Stack`을 사용하여 문제를 해결하고자 했지만 `Double Stack`의 핵심 로직중 `reversed()` 메서드의 빅오는 `O(1)`이지만 이를 변수로 할당할 때 즉 인덱싱 할 때 `O(1)`가 깨지는 것으로 확인되어 `Sigle Linked List`에서 `head`, `tail` 포인터를 두어 `enqueue`와 `dequeue`시 모두 빅오를 `O(1)` 가질 수 있도록 구현했습니다.

```swift
struct CalculatorItemQueue<Element: CalculateItem>: Queueable {
    private var head: Item<Element>?
    private var tail: Item<Element>?
    
    mutating func enqueue(element: Element) {
        let item = Item(element)
        
        if head == nil {
            head = item
            tail = item
            return
        }
        
        tail?.next = item
        tail = item
    }
    
    mutating func dequeue() -> Element? {
        guard head != nil else { return nil }
        
        let element = head?.element
        
        head = head?.next
        return element
    }
}
```


<br>

2️⃣ 노드 메모리 해제 <br>
-
🔒 **문제점** <br>
swift와 같은 ARC환경에서의 각각의 노드들에 대한 메모리해제가 어떻게 진행될 수 있는지 고민했습니다.

🔑 **해결방법** <br>
특정 인스턴스에 대한 Reference Count가 아무도 참조하고 있지 않음을 나타내는 순간 ARC를 통해 해당 객체나 인스턴스는 해제되게 됩니다. 따라서 구현한 링크드 링크드리스트의 head 및 tail을 지칭하고 있는 포인터를 가지고 있기 때문에 Queue가 해제될 때 해당 포인터들을 해제하면서 연결된 모든 노드들을 순차적으로 해제하게 됨을 알 수 있었습니다.

또한, dequeue 시 head에 대한 포인터를 변경할 때 이전의 head 포인터를 가지고 있지 않더라도 reference count가 줄었을 때 이전 head를 알아서 메모리 해제하기 때문에 추가적인 메모리 해제로직을 작성할 필요가 없다는 것을 알게되었습니다.
<br>

</br>

## 📚 참고 링크
- [🍎Apple Docs: reversed() ](https://developer.apple.com/documentation/swift/array/reversed())
- [🍎Apple Docs: reversedcollection](https://developer.apple.com/documentation/swift/reversedcollection)
- [🍎Apple Docs: bidirectionalcollection](https://developer.apple.com/documentation/swift/bidirectionalcollection)
- [📘stackoverflow: Array Indexing performance ](https://stackoverflow.com/questions/68332664/is-swift-array-reversedn-efficient-or-not)
</br>
