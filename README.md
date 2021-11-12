- [키워드](#키워드)
- [Reviewers](#Reviewers)
- [STEP 1 : Queue **타입 구현**](#STEP-1--Queue-타입-구현)
    + [고민했던 것](#1-1-고민했던-것)
    + [의문점](#1-2-의문점)
    + [Trouble Shooting](#1-3-Trouble-Shooting)
    + [배운 개념](#1-4-배운-개념)
    + [PR 후 개선사항](#1-5-PR-후-개선사항)

# 계산기 프로젝트

1. 프로젝트 기간: 2021.11.08 - 2021.11.19
2. Grounds Rules
    - 10시에 스크럼 시작
    - 프로젝트가 중심이 아닌 학습과 이유에 초점을 맞추기
    - 의문점을 그냥 넘어가지 않기
    - Time Rule
        - 아침: 10시
        - 점심시간: 12시~ 1시
        - 저녁시간: 6시~7시
        - 프로젝트 최대 시간: 9시 ~ 최대 9시 30분 까지!
3. 커밋 규칙
    - 단위 : 기능단위
    - 커밋 Convention: Karma Style

# 키워드
- `Array` `LinkedList`
- `Queue` `Stack`
- `Generic` `Element`
- `TDD` `Unit Test`
- `Assert`

# Reviewers

* [lina0322](https://github.com/lina0322)

# STEP 1 : **Queue 타입 구현**
- 자료구조 Queue 타입을 구현합니다.

# UML

![](https://i.imgur.com/pwLcl0n.jpg)

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#계산기-프로젝트)

## 1-1 고민했던 것
- Queue를 DoubleStack과 LinkedList를 이용하여 두가지를 구현해보았다. 배열로도 구현할 수 있지만 enqueue 작업이 시간복잡도가 O(1)이 걸려서 비효율적이다. 
- Generic타입을 사용할 때 Element로 명시해주었다. 이유는 T로 명시해줄 수도 있지만 어떤 타입이 들어갈지 명확하지 않기 때문에 좀더 직관적으로 보일 수 있도록 요소라는 뜻을 담은 Element를 명시했다. 

## 1-2 의문점
- Queue를 배열로 구현해도 괜찮을까? 
- Array에 제네릭 타입은 어째서 Element일까? 
- removeAll과 빈 배열을 할당하는 것과 차이점이 뭘까?

## 1-3 Trouble Shooting

### 1. Array에 제네릭 타입이 Element가 기재되어있는 경우
- `상황` 자료구조를 공부하다가 제네릭을 사용한 예제 코드들을 살펴보니 `<T>`로 작성되어있는 경우가 있고, `<Element>`를 사용한 경우가 있는데 둘의 차이가 궁금해졌다. 
    
![](https://i.imgur.com/POuRbFM.png)
    
- `이유` 공식문서 Generic 부분에서 `Naming Type Parameters` 부분을 살펴보니 이름이 없는 것과 이름이 있는 Element는 차이가 없지만 파라미터와 타입 사이의 관계를 가지고 있을때 명확함을 주기 위해 사용한다고 한다. 그러나 관계가 없는 상황에서는 `T`, `U`, `V` 를 주로 사용한다고 한다. 
- `해결` Array와 마찬가지로 Queue나 LinkedList도 요소들이 서로 관계가 있다고 생각하여, 타입 내부에 제네릭 타입`<T>`을 Element라고 명시해주었다. 
### 2. removeAll vs 빈 배열 할당하기

- `상황` 엘림에게 removeAll과 빈배열을 할당하는 것이 어떤 차이가 있냐고 질문을 받았는데 어떤 차이가 있는지 모르겠다.
- `이유` Swift github를 통해 removeAll 동작 방식을 한번 살펴보게 되었다.

![image](https://user-images.githubusercontent.com/75905803/141038635-c62fdf49-0118-4eaa-a035-9386a55d165c.png)

![image](https://user-images.githubusercontent.com/75905803/141038660-bc3d1d3f-388d-445d-bca2-1561e2aa3333.png)

- `해결` 살펴보니 파라미터 기본값을 따로 ture로 설정해주지 않는다면 빈 Array를 초기화해주는 동작을 하고 있었다. 따라서 빈 배열과 removeAll는 큰차이가 없는 것으로 결론이 났다.

## 1-4 배운 개념
- Element의 용도
- 자료구조 (`Array`, `LinkedList`, `Queue`, `Stack`)
- 알고리즘의 시간도와 Big-O
- removeAll과 빈 배열을 할당하는 것은 큰 차이가 없다.

## 1-5 PR 후 개선사항

- 불필요한 import 제거
- 추가적으로 attribute에 대해서 공부해보기.
- 짧은 return문이라도 줄바꿈 해주는 것이 디버깅 시 유용하다.
- 메서드 탈출하는 부분은 보통 if보다는 guard를 주로 사용하는 것이 적절한 것 같다.

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#계산기-프로젝트)

# STEP 2 : 계산 타입 및 주변 타입 구현

- 계산 타입을 구현합니다.

## 2-1 고민했던 것

이번 스텝 진행을 위해 저와 고민을 나눠주셨던 캠퍼분들에게 감사의 인사를 드립니다.

---

- 주어진 UML을 보며 타입이 어떤 역할을 하는지 유추하면서 정리해보았다.

### ExpressionParser

- 사용자의 입력값을 검사해서 연산자와 피연산자를 담는 Formula를 만드는 타입
    - `componentsByOperators`
        - input을 받아서 숫자만 뽑아오는 메소드
    - `parse`
        - 사용자 입력을 받아서 Formula를 반환하는 메소드

### extension String

- `split(with:)`
    - target을 기준으로 문자열을 잘라 배열로 반환하는 메소드
    예시) "12 + 3.1" → ["12", "+", "3.1"]

### Formula

- 연산자큐와 피연산자큐를 담고, 결과(`result()`)를 내는 타입

### Operator

- 연산자와 계산 메소드가 있는 타입

---

### split의 로직에 관한 다양한 고민

- 첫번째는 split을 확장한다는 의미 자체가 `기존 split과의 기능이 다르다고 생각`이 들었다. 그래서 `target과 함께 자르는 것`인가? 라는 생각이 들었다. 연산자와 Double 타입으로 변환할 수 있는 숫자가 함께 배열로 반환되어 Formula를 반환해주는 로직을 생각해보았다.
- 위에서 생각한 로직으로 먼저 돌아가게끔 구현을 해보았더니 **target을 안쓰게 되었다**. 먼저 고려했던 것은 숫자, 연산자가 여러개가 들어온다는 가정하에 구현했기 때문이다. target이 안쓰이는 것이 너무 찝찝하여 여러 캠퍼분들과 같이 고민을 나누어보았다.
- 많은 고민들 끝에 버튼을 누를 때 숫자와 연산자를 구분할 수 있는 `특정 문자열을 임의로 넣어 문자열을 만들 수 있겠다는 생각`을 **공유**받았다. (chacha 고맙습니다...😭) 그래서 연산자를 누를 때 마다 `앞 뒤로 공백이 추가되는 로직`이 떠올라서 그대로 옮겨서 작성해보았다.
- 그러나 Operator 타입이 `Character`인 부분과 `CaseIterable 프로토콜`을 채택한 것을 보았을 때 이것을 split을 할 때 사용하지 않을까? 라는 의문이 또 생겼다. 사실 공백을 추가해서 잘라줄 수도 있겠지만 `하드코딩`이라는 생각이 먼저 들었다. 이후 Operator의 rawValue를 이용하여 split을 구현해볼까 고민해보았지만.. 일단 target의 타입이 배열이 아닌 부분과 allcases를 사용해서 rawValue를 뽑아올 수 없는 점 때문에 해당 의문점은 해결하지 못하였다.

### dequeue할 때 옵셔널바인딩을 할 것인지? 에러처리를 할 것인지?

- 원래는 dequeue를 할 때 nil이 반환 되게끔 구현을 하였었는데, 일일히 옵셔널 바인딩 처리 해주면 지저분해지겠다는 생각이 들어서 해당 로직을 에러를 던지는 로직으로 바꾸어주었다. 이후에도 계속 코드가 더럽다고 느껴져서 다시 고민해보다가... `nil이 반환하게끔 재수정`을 해주고 `result` 부분을 새로 작성해보았다.

### parse에서 Double배열과 Operator배열을 nil 체크 후 반환해주기

- 처음에는 compactMap의 로직을 참고하여 `filter`와 `map`을 이용하여 nil 체크를 하여 변환해주었었는데, 그럴 필요 없이 `compactMap`을 사용하면 될 것 같네? 라는 생각이 들어서 수정해주었다.

### 기존에 구현해주었던 Model의 이니셜라이저 추가

- STEP 1에서 구현해줄 때에는 이니셜라이저를 구현해주지 않았었는데, STEP 2를 구현하다보니 이니셜라이저를 통한 초기화를 해주어야 하는 순간이 오게되어 이니셜라이저를 모두 구현해주었다.

## 2-2 의문점

- split(with:) 메소드의 역할이 정확히 뭘까?
- dequeue시 옵셔널바인딩 vs 에러핸들링
- NaN은 어떤 시점에 발생하는 걸까?

## 2-3 Trouble Shooting

### 1. 빈 프로토콜의 존재 의미가 뭘까?

- `상황`  STEP 1을 진행할 때 빈 프로토콜을 구현해두라는 부분에서 잘 이해가 가지 않았다.
- `이유` 알고보니 CalculateItem은 `Queue에서 다루는 요소`가 준수해야했던 프로토콜이였다.
- `해결`  STEP 2를 진행하게 되면서 해당 프로토콜의 역할을 잘 이해할 수 있었고, 덕분에 빈 프로토콜의 용도에 대해서 알게되었다.

### 2. UML 클래스 다이어그램 화살표에 대해서

- `상황` STEP 2에서 주어졌던 UML에 대한 의문이 생겼다. 왜 내부적으로 연결되어있는 타입끼리는 화살표 표시가 없을까?
- `이유` 이러한 궁금점을 오동나무에게 직접 질문해보았다.
- `해결` 클래스 다이어그램은 표면적으로 드러난 관계만 나타내기 때문에 내부 구현에 대해서는 화살표가 없을 수도 있다.

## 2-4 배운 개념

- 빈 프로토콜을 활용하는 방법
- 고차함수의 동작 방식
- UML 클래스 다이어그램
- NaN

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#계산기-프로젝트)
