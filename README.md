## 목차

#### 1. [👥 팀원](#1.-팀원)
#### 2. [🏞 이미지로 보는 타임라인](#2.-이미지로-보는-타임라인)
#### 3. [🗿 고민한 점🗿](#3.🗿고민한-점🗿)
#### 4. [☄️ 트러블 슈팅](#4.트러블-슈팅)
#### 5. [🔎 참고 링크](#$5.-참고-링크-🔎)
--- 
# 1. 팀원 👥

| <center> Jeremy |
| -------- |
| <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  |
| [<center>*@yjjem*](https://github.com/yjjem) | 
---
  
# 2. 이미지로 보는 타임라인

> **구현 시작 전 계산기 앱 예상 메커니즘 ( 딕셔너리 )**
<img src="https://i.imgur.com/2LPUbtR.jpg"/>
    
> **딕셔너리 Queue.**
    Linked List와 비슷한 형태를 띰. Key로 현재 index를 가지고, Value로 데이터를 가지고있는 모습.
    이렇게 하면 RandomAccessCollection을 Queue구현에 필요한 순서대로 Insertion, Deletion을 가능하게 합니다.
    ```swift
    var myDict: [Int: Item]
    ```
<img src="https://i.imgur.com/RzBmVLh.jpg"/>


> **딕셔너리 queue 구현 UML**
<img src="https://i.imgur.com/Yp27Lek.jpg"/>
    
> **구현 시작 후 계산기 앱 예상 메커니즘 ( 딕셔너리 )**
<img src="https://i.imgur.com/MeMPAMH.jpg"/>
    
> **현재 사용중인 방법 - 단방향 Linked List**
<img src="https://i.imgur.com/FCUrHu7.jpg"/>  

> **Formula 계산방식 - 2개의 Linked List**
<img src="https://i.imgur.com/wkpvxYC.gif"/>

# 3.🗿**고민한 점**🗿
***Dictionary*** 🆚 ***Linked List*** 🆚  ***Array***
> 왜 Linked List, Array가 Queue 구현에 있어 자주 사용이 될까? Dictionary는 왜 쓰지 않는가?

***Dictionary 순서***
> Dictionary는 RandomAcessCollection이다. 어떻게 하면 순서를 가지게 할 수 있을까?
- KeyValuePairs는 Swift에 생긴지 얼마 안된 개념인 듯 하다. 요약해보자면 순서를 가지는 딕셔너리를 만들 수 있게 해주는데 아쉽게도 only gettable이다. 즉 사전에 구성된 딕셔너리만이 KeyValuePairs 타입이 될 수 있다.. append, remove 모두 불가능하다는 뜻이다.
    
> Dictionary method getFirst()
- RandomAcessCollection인 딕셔너리에 무용지물인 메소드이다.. 

***Linked List***
> 자기 참조, 메모리

- 처음 Linked List의 head와 tail에 자기참조하도록 만들지 않고 Node인스턴스를 넣어주기만 해서 사실상 head가 계속 바뀌는 문제가 있었습니다. 자기참조, 메모리 메모...
    
*** ***  
    
# 4.**트러블 슈팅**
    
> 어떻게 RandomAcessCollection이 타입 변형 없이 순서를 가지게 만들것인가..

딕셔너리 요소의 Key가 인덱스가 되어주면 됩니다.
```swift
var queue: [Int: Item] = [
    0: Item,
    1: Item,
    2: Item,
    3: Item
    ]
```

> 어떻게 불필요한 변수들을 줄일것인가.

초기에 구상하면서 firstIndex, elementCount를 정의하여 요소가 추가, 제거될 시 index를 추적할 수 있도록 했습니다.하지만 제대로 핸들링 해주지 않으면 오류가 발생하기 쉽죠. 따라서 최대한 변수를 없애는 방향을 선택했습니다.

***Before***
```swift
struct CalculatorItemQueue {
    private var elementCount: Int = 0
    private var firstIndex: Int = 0
    var queue: [Int: Item] = [:]

    mutating func add(item: Item) {
        defer { elementCount += 1 }
        self.queue[elementCount] = item
    }
    
    mutating func getFirst() -> Item? {
        defer { firstIndex += 1 }
        return queue.removeValue(forKey: firstIndex)
    }

    mutating func removeAll() {
        queue = [:]
    }
}

```
***After***
```swift
struct CalculatorItemQueue {
    var queue: [Int: Item] = [:]

    mutating func add(item: Item) {
        self.queue[queue.count] = item
    }
    
    mutating func getFirst() -> Item? {
        guard let firstIndex = queue.keys.min() else { return nil }
        return queue.removeValue(forKey: firstIndex)
    }

    mutating func removeAll() {
        queue = [:]
    }
}
```

> split 메소드에서 String의 split 메소드

그저 self만 붙여주면 해결되는 문제였습니다...
```swift!
extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
```




# 5. 참고 링크 🔎 
  
> Dictionary
  
[🌏 Swift.org - Collection types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
[🌏 Devloper - Dictionary](https://developer.apple.com/documentation/swift/dictionary)
    
> KeyValuePairs
  
[🌏 Devloper - KeyValuePairs](https://developer.apple.com/documentation/swift/keyvaluepairs)


> NSCache
  
[🌏 Devloper - NSCache](https://developer.apple.com/documentation/foundation/nscache)
    
> Linked List
  
[🌏 Blog - 슈프림 Linked List 구현](https://tngusmiso.tistory.com/20)
[🌏 Blog - 태미네이터의 이런 저런 삶 Linked List 구현](https://taeminator1.tistory.com/36)
[🌏 Blog - 태미네이터의 이런 저런 삶 Linked List Queue 구현](https://taeminator1.tistory.com/37)

    
> Time Complexity
  
[🌏 Blog - Hanmon. TimeComplexity](https://hanamon.kr/%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-time-complexity-%EC%8B%9C%EA%B0%84-%EB%B3%B5%EC%9E%A1%EB%8F%84/)      
[🌏 Geeksforgeeks - DataStructure TimeComplexity](https://www.geeksforgeeks.org/time-complexities-of-different-data-structures/) 
