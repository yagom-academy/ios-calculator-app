# 🏦계산기

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
사용자의 입력을 받아 기본 연산을 수행하는 계산기입니다.

* 주요 개념: `Protocols`, `Extensions`, `Generic`, `Type Casting`, `Error Handling`

</br>

## 👨‍💻 팀원
| hoon |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/HylLMDsN2.jpg"  width="200" height="200"> |
|[Github Profile](https://github.com/Hoon94) |


</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.29.| - Unit Test 실험|
|2023.05.30.| - Node, Linked List 타입 생성 및 Unit Test 진행 |
|2023.05.31.| - CalculatorItemQueue 타입 생성 및 Unit Test 진행 </br> - UML 작성 |
|2023.06.01.| - Generic 타입 수정|
|2023.06.02.| - README 작성|


</br>

## 👀 시각화된 프로젝트 구조
### Diagram
<p align="center">
<img width="800" src= "https://hackmd.io/_uploads/BJuRGQr82.png" >
</p>

</br>

## 💻 실행 화면 - 추후 작성 예정

| 화면 |
|:--------:|
|<img src="" width="800">|




</br>

## 🧨 트러블 슈팅

1️⃣ `Linked List` 사용 <br>
-
🔒 **문제점** <br>
- `CalculatorItemQueue`를 만들기 위해 어떠한 자료 구조를 사용할지 고민했습니다. 처음 기본적인 틀을 구성할 때는 가장 쉬운 `Array` 타입을 생각하였습니다. 내부적으로 구현되어 있는 `Array`의 메서드를 통해 `CalculatorItemQueue`의 `list`를 구성할 수 있었습니다. 하지만 `CalculatorItemQueue`에서 `dequeue`를 실행할 때 `Array` 자료구조의 문제점이 드러났습니다. `Array`에서 마지막이 아닌 원소를 제거할 때 남은 원소들을 앞으로 옮기며 빈 메모리 공간을 채웁니다. 이런 동작을 수행하기때문에 `dequeue` 메서드를 실행할 때 시간 복잡도는 O(n)이라고 합니다.

🔑 **해결방법** <br>
- `Linked List`를 사용하여 `dequeue`의 문제점을 해결할 수 있었습니다. 처음 입력받은 `node`를 `dequeue`하는 과정에서 맨 앞의 `node`에 대한 연결을 끊어주었습니다. `head`를 사용하여 `Linked List`의 첫 노드에 대해 알고 있다가 `dequeue`가 일어나는 과정에서 `head`를 다음 `node`로 옮기고 이전 `node`를 해제했습니다. `head`는 항상 첫 `node`를 참조하고 있기 때문에 시간 복잡도가 O(1)인 만큼 더 빠른 동작이 가능했습니다.

    ```swift
    mutating func append(_ data: T) {
        guard head != nil
        else {
            head = Node(data: data)
            tail = head
            return
        }

        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    ```

<br>

## 📚 참고 링크
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)
- [🍎Apple Docs: Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)
- [📘blog: Generic](https://babbab2.tistory.com/136)
