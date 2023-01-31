# 🧮계산기

## 📚목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)

<br/>

## 1. 소개
연산자를 통한 수식을 계산할 수 있는 프로그램

### Model

- **CalculatorItemQueue**
    - **피연산자와 연산자를 담기 위한 더블 스택 큐 구현**
        <br/>
        > * dequeueStack과 enqueueStack을 통해 값들을 담아줄 수 있는 큐 구현
        > * 각각의 Stack에 값이 담겨져 있는지 확인하기 위한 isEmpty프로퍼티 구현
    
    
    
### Tests    
- **CalculatorTests**
    - **CalculatorItemQueue를 테스트할 수 있는 테스트 구현**
        <br/>
        > * isEmpty프로퍼티 테스트 구현
        > * enqueue메서드 테스트 구현
        > * dequeue메서드 테스트 구현

<br/>




## 2. 팀원


| 송준 | 
| :--------: | 
|   <Img src = "https://i.imgur.com/9Bd6NIT.png" width="200" height="200"/> |
| <center>Solo</center>  |     
| <center>[Github Profile](https://github.com/kimseongj)</center> |



</br>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.01.24 (화) ~ 23.02.04 (금)** 

> 23.01.24 (화) : STEP 1. 진행 (Array Queue구현) <br/>
> 23.01.25 (수) : STEP 1. 진행 (Double Stack Queue구현) <br/>
> 23.01.26 (목) : PR 피드백을 통한 코드 리팩토링  <br/>
> 23.01.27 (금) : STEP 2. 진행 (입력된 값을 큐에 담아주는 로직 구현) <br/>


<br/>

## 4. 프로젝트 구조
#### UML
![step1-UML](https://user-images.githubusercontent.com/88870642/214513541-6c6ebaf6-f4d5-49f1-94e4-e0406c5eb3d6.jpg)

#### 파일 구조
3주차 추가예정

<br/>

## 5. 실행 화면(기능 설명)
3주차 추가예정

<br/> 

## 6. 트러블 슈팅
### STEP 1.

<details>
<summary>1. Array? DoubleStack?</summary>

1. **Array**
- Queue를 구현함에 있어 어떤 방법을 채택할지 고민해봤습니다!
- Array를 사용할 경우 DoubleStack에 비해 코드가 간결하다는 이점이 있었습니다. 
- Array를 사용한 Queue는 데이터를 pop할 경우 빈 인덱스가 생기게 되고, 인덱스를 앞으로 당겨줘야 합니다.
- 이 때 시간복잡도는 O(n)으로 다른 방법을 채택할 경우 보다 시간복잡도가 높습니다.
- 이를 해결하기 위해 pop된 index에 nil값을 넣어서 head를 통해 표시해주고 일정량이 되었을 경우 삭제해주는 방법이 있습니다.
- Array로 만든 Queue 코드
```swift
struct CalculatorItemQueue<T> {
    
    var queue: [T?] = []
    var head: Int = 0
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(item: T) {
        queue.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard head <= queue.count, let item = queue[head] else { return
            
            nil }
        queue[head] = nil
        head += 1
        
        if head > 10 {
            queue.removeFirst(head)
            head = 0
        }
        return item
    }
}
```

2. **DoubleStack**
- DoubleStack의 경우 시간복잡도 O(1)로 Array보다 시간복잡도가 낮습니다.
- 비교적 Array보다 복잡한 코드를 작성해야 합니다.
- TestCase를 작성할 때, enqueue매서드와 dequeue매서드의 의존성이 높았습니다.

Queue를 Array로 head를 사용하여 구현할 경우, 결국 nil인 값을 삭제해줘야 된다는 점을 생각해보면 DoubleStack을 사용하는게 좋아보입니다.
</details>

## 7. 참고 링크
- [Protocol - Swift Laguage Guide](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [Queue - 개발자 아라찌](https://apple-apeach.tistory.com/8)
<br/>



