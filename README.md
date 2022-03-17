### 계산기 프로젝트
> 프로젝트 기간 2022.03.14 ~ 2022.
팀원 : [@malrang](https://github.com/kinggoguma) / 리뷰어 : [도미닉](https://github.com/AppleCEO)

- [UML](#UML)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
    
## UML
더블 스택큐
![asd](https://user-images.githubusercontent.com/88717147/158518548-08c96f45-b77e-429b-837f-5b28fc6d0fa5.png)

## STEP 1 기능 구현
1. 더블 스택 큐
- resetQueue() 저장된 모든 데이터를 삭제 해주는 메서드
- enQueue() 큐 배열의 마지막에 데이터를 저장해주는 메서드
- deQueue() 큐 배열의 처음 데이터를 제거, 반환 해주는 메서드

2. 링크드 리스트 큐
- removeAll() 저장된 모든 노드 를 제거해주는 메서드
- removeFirst() 저장된 처음 노드 를 제거해주는 메서드
- append() 새로운 노드를 마지막 노드로 추가해주는 메서드


## 고민했던 것들
1. Queue 구현
- Queue 에 대한 예시를 찾아보니 배열 하나로 구현하는방법, 배열 두개로 구현하는 방법, 링크드 리스트를 이용한 방법 등이 있었다.
- 배열로 구현하게되면 배열은 stack(LIFO)방식으로 저장되기 때문에 처음 저장한 값을 제거 하게되면 배열에 저장된 element 갯수 만큼 인덱스 위치를 -1 씩 해주어야해서 시간 복잡도가 늘어난다는것을 알게 되었다.
- 그렇다면 순서가 있는 컬렉션 타입 말고 다른 것으로 구현시켜주면 삭제해주더라도 -1 해주는 과정이 없어 시간복잡도 면에서 유리하지 않을까? 생각하여 다른 타입으로 구현하는것을 고민함
2. 프로토콜 활용 방법
- 큐 배열 에서 활용될 프로토콜 채택 방법을 어떻게 해야할지 고민함.
- 큐 에서 사용될 Element가 프로토콜을 채택 하게끔 해야할지.
- 프로토콜을 채택한 타입만 배열에 넣어 사용해야할지.
```swift
struct CalculatorItemQueue<Element: CalculateItem> {
    private var addStack: [Element] = []
    private var subStack: [Element] = []
    }
```
```swift
struct CalculatorItemQueue {
    private var addStack: [CalculateItem] = []
    private var subStack: [CalculateItem] = []
    }
```
3. 큐 배열에 element가 여러개일때 deQueue 를 한번만 실행한후 enQueue 를 실행할경우
```swift
    mutating func deQueue() -> CalculateItem? {
        if subStack.isEmpty {
            subStack = addStack.reversed()
            addStack.removeAll()
        }
        return subStack.popLast()
    }
```
- 이부분은 고민하다 계산기 프로젝트에서는 이대로 사용해도 괜찮을것 같아..수정하지않았다..
- 계산기 특성상 deQueue를 호출하면 배열에있는 모든 element를 제거 하기전까지 enQueue 기능을 사용할수 없기 때문에 이번 프로젝트에서는 문제가 될것같지 않았다..!

4. 온전한 링크드 리스트 와 프로젝트에서 사용될 링크드 
처음 더블스택 큐 를 채택 한 이유는 계산기 프로젝트에 비해 링크드 리스트 를 구현하는것이
덩치가 너무큰 것을 구현하는것이 아닐까?
생각이들어 더블스택 큐 를 채택 했으나 
링크드 리스트 를 활용해보며 이부분에대해서 똑같은 고민이 생겨 온전한 링크드 리스트 를 만들어 사용하기보다 기능을 축소시켜 이번 프로젝트에서만 사용할수있게끔 덩치를 줄여 구현해야 할지 고민함.

## 배운 개념
- unit-test
- 자료구조 Queue
- generic

## PR 후 개선사항
