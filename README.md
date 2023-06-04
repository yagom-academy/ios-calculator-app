# ➗✖️ 계산기 ➕➖

> 프로젝트 기간 :  2023.05.29 ~ 2023.06.09


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [다이어그램](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

    계산기 어플을 구현하고자 합니다.

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) |
| :--------: |
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

|날짜|내용|
|:---:|---|
| **2023.05.29** |▫️  UnitTest 타겟설정<br>▫️ CalculatorItemQueue 큐타입 정의<br>▫️ CalculateItem 프로토콜 정의|
| **2023.05.30** |**TDD** <br>▫️ 1을 queue에 넣으면 queue에 1이 있는지 확인하기 위한 테스트 생성<br>▫️ enqueue함수 정의<br>▫️ string을 queue에 넣으면 queue에 string이 있는지 확인하기 위한 테스트 생성|
| **2023.05.31** |**TDD** <br>▫️ enqueueForString 함수 생성<br>▫️ Int와 String 배열을 any 타입의 배열로 통합<br>▫️ Double을 queue에 넣으면 queue에 Double이 있는지 확인하기 위한 테스트 생성<br>▫️ Double Extension 생성<br>▫️ queue배열이 비어있을때 true를 반환하는지 확인하기 위한 테스트 생성<br>▫️ isEmpty 생성<br>▫️ queue배열에서 삭제시키고자하는 값을 peek에 반환하는지 확인하기 위한 테스트 생성<br>▫️ peek 생성<br>▫️  reversedQueue배열이 비어있을 때 queue배열을 뒤집어서 넣는지 확인하기 위한 테스트 생성<br>▫️ dequeue 함수 생성<br>▫️ queue배열이 뒤집히면 해당 배열 삭제 후 reversedQueue의 마지막요소를 반환하는지 확인하기 위한 테스트 생성<br>▫️ dequeue 함수 조건 및 리턴타입 변경|
| **2023.06.01** |▫️ Calculator Class Diagram|


<br>

<a id="4."></a>
## 4. 📊 다이어그램

<Img src = "https://postfiles.pstatic.net/MjAyMzA2MDRfMTEy/MDAxNjg1ODYxMjY0NzE2.J0siLtISEQk0dNBQR2cL5JiwjTRW_hW4bQVPUVAWr4Eg.HsbsAw0-ZNFkIAHvzvRJmw0VGfdLjYbxCTtSHM-ixZcg.PNG.sha0720/Calculator.drawio.png?type=w773" width="350"/>

<br>

<a id="5."></a>
## 5. 📲 실행 화면

(추후 업로드 예정)

<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### 🔥 효율적인 Queue 구현 방법이 어떤 것일까?
- Queue를 구현하기 위해 크게 4가지 방법을 공부했습니다. 이 중 어떤 구현 방법을 선택해야할지에 대한 고민을 했습니다.
- 먼저 시간 복잡도에 대한 고민을 했습니다. 각 로직별로 시간 복잡도가 다르다는 것을 알게되었습니다. 하여 어떤 구현 방법을 사용했을 때 가장 효율적일 수 있는 지를 가장 먼저 고민했습니다.
- 두번째로 계산기라는 어플의 흐름에 어떤 구현 방법이 어울릴까를 고민했습니다. 계산기는 사용자가 입력한 숫자를 순차적으로 받고, 이의 결과값을 출력해주는 것이 가장 주된 기능 흐름이라 생각했습니다. 이런 흐름에 어떤 구현 방법이 어울릴지 고민했습니다.

1. Array를 사용하는 방법
    - 시간 복잡도 : 인덱스의 순서가 있는 Array에 `.append`를 사용하여 요소를 enqueue하고, `.removeFirst`를 사용하여 맨 앞의 인덱스를 dequeue하는 방식으로 queue를 구현할 수 있습니다. 하지만 이때 enqueue의 시간복잡도는 O(1)이지만, dequeue의 시간복잡도는 O(n)이 됩니다. 맨 앞의 인덱스를 dequeue 시 모든 인덱스의 순서를 하나씩 앞으로 땡겨야하기 때문입니다. 즉 `.removeFirst`를 사용하여 dequeue 시 시간복잡도가 높아진다는 문제점이 존재합니다. 
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : dequeue의 시간복잡도 문제만 제외하면 구현 방법도 간단하고, 기능 흐름에도 적합할 수 있는 방법이라 생각했습니다.

2. 임의의 head를 생성하여 배열 요소의 dequeue index를 지정하는 방법
    - 시간 복잡도 : 위와 enqueue의 방식은 동일하지만, 임의의 `head`가 가리키는 인덱스를 변경만 하는 방법이기 때문에 dequeue 시 시간 복잡도를 O(1)로 만들 수 있다는 장점이 있습니다. 하지만 head를 옮기면서 삭제된 인덱스의 값은 nil로 수정하게 되고, 결국 이 nil의 값들은 축적이 될 것입니다. 하여 이를 임의로 삭제해주는 추가 작업이 있어야 한다는 번거로움이 있습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하지 않다고 생각했습니다. 계산기는 단순 작업 어플이 되어야한다고 생각했습니다. 위의 nil값이 축적되는 부분이 이러한 계산기의 특성과는 다소 어울리지 않을 수 있다는 생각을 했습니다.
    - 결론 : dequeue 시 생기는 nil의 값을 처리하는 부분이 해결된다면 좋은 방법이라고 생각했습니다.

3. Double Stack을 활용하는 방법
    - 시간 복잡도 : 이 방법은 기존의 array와 동일하게 enqueue를 진행하지만 dequeue를 진행하는 방법에서 차이를 보입니다. dequeue 시 2개의 Array를 사용하여 stack의 특성인 `Last-in-First-out`을 구현합니다. 기존의 배열을 뒤집어 새로운 배열에 저장한 뒤 기존의 배열을 삭제하고 `.popLast`를 사용하여 뒤집힌 배열의 마지막요소를 추출합니다. dequeue 시 `.popLast`를 사용함으로 시간 복잡도는 O(1)로 줄일 수 있습니다. 하지만 기존의 배열을 뒤집어서 새 배열에 할당하는 작업의 시간복잡도가 O(n)이기 때문에, 이를 사용하는 경우 시간 복잡도가 높아진다는 단점이 있습니다. 즉 이 방법은 조건별 시간 복잡도가 다르다는면에서 효율적인 방법이 아니라고 생각될 수 있습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : 조건 별 시간 복잡도가 높아질 수 있다는 부분을 제외하면 좋은 방법이라 생각했습니다.

4. LinkedList 형태로 구현하는 방법
    - 시간 복잡도 : LinkedList 중에서도 단방향 연결 리스트 방법을 고민했습니다. 이 방법을 통해 enqueue와 dequeue를 하게 되면, 특정 노드의 연결 주소값을 변경하고 값을 변경하는 식으로 진행되기 때문에 시간 복잡도가 높지 않을 것이라 생각됩니다. 하지만 값을 접근할 경우 속도가 느린 점, 메모리 공간을 많이 차지할 수 있다는 점도 고민을 해봐야한다고 생각했습니다.
    - 기능 흐름 : 계산기의 기능적 흐름을 구현하기에 적합하다고 생각했습니다.
    - 결론 : 저는 계산기에 입력되는 마지막 값에 접근을 할 경우가 존재할 것이라 생각했습니다. 이런 부분에서 LinkedList는 마지막 인덱스에 접근할 때 시간복잡도가 O(n)으로 높기 때문에 적합한 방법은 아니라 생각했습니다.
-> 사실 시간 복잡도와 기능흐름 중 시간 복잡도에 대한 고민을 중점적으로 했습니다. Double Stack이 가장 시간 복잡도 측면에서 효율적일 수 있다는 확신이 들지 않아 고민을 하던 차에 아래 블로그를 참고하였습니다. 이 블로그에 따르면 Double Stack의 시간 복잡도가 가장 낮다는 것을 확인할 수 있었습니다. 하여 저는 Double Stack을 활용하여 코드를 진행하고자 했습니다.
- [📘 Blog: Queue in Swift](https://woongsios.tistory.com/222)
                            

<br>


<a id="7."></a> 
## 7. 🔗 참고 링크
- [🍎 Apple Docs: Generic Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Generic-Types)
- [🍎 Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [📘 Blog: 큐 구현하기](https://babbab2.tistory.com/84)
- [📘 Blog: Swift로 구현한 Queue 와 더블스택](https://apple-apeach.tistory.com/8)
- [📘 Blog: 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
- [📘 Blog: 지네릭 (Generics)](https://jusung.gitbook.io/the-swift-language-guide/language-guide/22-generics)



<br>

<a id="8."></a>
## 8. 💭 회고
### 👏🏻 잘한 점
- 프로젝트를 진행하기 전에 관련 공부를 성실하게 선행하였습니다.
- 막히는 부분이 있을 때 주위에 도움을 구하였습니다.
        
### 👊🏻 개선할 점
- 단시간에 많은 내용을 학습하다보니 아직 개념을 완벽하게 이해하지 못한 거 같아서 아쉬웠습니다.
- 프로젝트의 타임라인을 완벽히 충족시키지 못했습니다.

