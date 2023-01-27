## Calculator - 계산기 :fire:
## 프로젝트 개요
* 계산기UI에서 데이터를 입력받아 연산처리하는 프로젝트
* 프로젝트 인원: [Goat]()
* 프로젝트 기간: 2023.01.24 - 23.02.03

## 목차
- [타임라인](#타임라인)
- [순서도](#순서도)
- [클래스 다이어그램](#클래스-다이어그램)
- [트러블 슈팅](#트러블-슈팅)
- [키워드](#프로젝트를-통해-학습한-키워드)



## 폴더 구조

```
├── Controller
|   └── ViewController
├── Model
|   ├── CalculateItem
|   ├── Extension
|   └── Operator
|   └── CalculateQueueItem
|   └── Formula
|   └── ExpressionParser
└── View
    ├── Main
    └── Assets

```

----
    
## 타임라인
> 시간 순으로 프로젝트의 주요 진행 척도를 표시
> - 23.01.23(월): --설연휴--
> - 23.01.24(화): 제시된 UML구조파악 및 queue자료구조 공부
> - 23.01.25(수): STEP1 시작, queue구현, PR요청
> - 23.01.26(목): STEP1 PR리뷰사항 반영, merge
> - 23.01.27(금): STEP2 시작

> - 23.01.30(월): 
> - 23.01.31(화): 
> - 23.02.01(수): 
> - 23.02.02(목): 
> - 23.02.03(금): 

<br/>

## 클래스 다이어그램

<img src="https://i.imgur.com/1FtCoTY.jpg" width="800" height="700"/>


<br/>


### 기능 설명

## 트러블 슈팅

#### 1. DoubleStack
* queue 구조에서 dequeue구현시 배열에서의 removeFirst()가 O(N)의 시간복잡도를 가지기 때문에 문제가 생긴다는 점을 발견했습니다
* 시간복잡도를 해결하는방법으로 여러 방법이 있었는데, 저는 stack을 두개 운영하면서 옮겨사용하는 방법으로 채택했습니다

```swift
var enqueueStack: [T] = []
var dequeueStack: [T] = []

mutating func dequeueItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
            return dequeueStack.popLast()
    }
```
#### 2. extensin String - split(with: Character) 매서드 구현에서의 문제
* 제시된 UML을 해석해보면 split은 `Characte`타입인 `Operator`를 기준으로 `split()`하는 매서드이며, 
`componentsByOperators(from target: String) -> [String]`안에 들어와 String배열을 내보내는 구조인거같은데, 이 부분을 구현하는데 에러가 많았습니다.
    1. (문제) split은 기준을 두고 나눠진값을 배열로 반환한다 -> split한 결과를 빈배열에 담아서 append하려니 이중배열이 되는 문제가 생겼습니다.(
        * (해결) `curruentNumber[] += $0.split(someChracter: number.rawValue)` += 로 빈배열에 결과를 담는식으로 해결했습니다
        * (해결2) split을 담아내는 이중배열을 flatMap고차함수로 해결했습니다
```swift
 var resultNumber: [String] = [target]
        
        Operator.allCases.forEach { oper in
            resultNumber = resultNumber.map { $0.split(someChracter: oper.rawValue) }.flatMap {$0}
        }
```

<br/>

#### 3. split()으로 피연산자만 뽑아내는데 성공했지만, 음수/양수 변경하는 부분에서 고민
```swift
"1 + 3 x (-11) + 34 * 5" // split 적용했을 때
-> ["1", "3", "11", "34", "5"]
```
* 위와같은 경우의 `String`을 받아와 `split()`했을때 음수에 대한 `Operator` 역시 `split()`에서 걸러지므로 사라지는 경우가 생길 수 있다고 생각했습니다.
    * split()부분에서 시행착오가 많았어서 일단 넘어갔는데, 음수 양수 변환문제를 어떻게 해결할지 추후에 다시 생각해봐야할것 같습니다.



### 프로젝트를 통해 학습한 키워드
- `class`, `struct`
- `forEach`, `flatMap`, `map`, `closure`
- `doubleStack`
- `split`, `split(whereSeparator: Bool)`, `split(maxSplits: Int)`
## 팀회고
