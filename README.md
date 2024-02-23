## Diana, Gray의 이상한 계산기 🧮

### 목차
[1. 소개](#1-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 실행 화면](#4-실행-화면)  
[5. 트러블슈팅](#5-트러블슈팅)  
[6. 팀 회고](#6-팀-회고)  
[7. 참고 자료](#7-참고-자료)  

---
### 1. 소개
#### **Diana, Gray의 이상한 계산기 🧮**
 아이폰의 계산기와 동일해보이지만, 사칙연산 계산 순서는 우리가 아는 것과는 조금 다른 계산기입니다.</br>
 어떻게 다른지 직접 이상한 계산기를 이용해 보세요! 🙃

### 2. 팀원
| <img src="https://avatars.githubusercontent.com/u/57698939?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/139211436?v=4" width="200"> |
| :---: | :---: |
| Prism ([Github](https://github.com/Diana-yjh/)) | Gray ([Github](https://github.com/yawoong2)) |

### 3. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.02.05(월) ~ 24.02.07(수) | __피연산자와 연산자를 입력받아 사칙연산을 처리하기 위한 Queue 및 LinkeList구현__ </br> - Node class 생성 및 LinkedList(append, pop, peek, size, clear) 구현</br> - LinkedList에 구현한 메서드를 활용하여 Queue(enqueue, dequeue) 구현 |
| 24.02.13(화) ~ 24.02.15(목) | __계산기로부터 입력받은 피연산자와 연산자를 Queue에 각각 저장하기 위한 Formula, ExpressionParser 구현__</br> - Formula : 입력 받은 피연산자와 연산자를 Queue에 삽입</br> - ExpressionParser : 입력 받은 값들 중 피연산자 값들만 배열로 저장
| 24.02.19(월) ~ 24.02.22(목) | __입력 받은 계산을 처리하는 모델 병합 및 리팩토링__</br> - 어느 코드가 적절한지 고려하며, 코드 병합</br> - 시간복잡도를 고려하여 components(separatedBy:), 및 split(separotor:).map 중 알맞은 메서드 선택</br> - 시간복잡도를 고려하여 split(with:).joined(), 및 replacingOccurrences(of:,wifh:) 중 알맞은 메서드 선택|
| 24.02.23(금) | README 작성 |

### 4. 실행 화면
추가 예정

### 5. 트러블슈팅

#### ❗️연산을 처리할 때, 초기화 방법 수정
##### 📌 문제 상황
```swift
mutating func result() -> Double {
    var calculateResult = 0.0
        
    while let operand = operands.dequeue() {
        guard let `operator` = operators.dequeue() else {
                return .nan
            }
            
        calculateResult = `operator`.calculate(lhs: calculateResult, rhs: operand)
    }
        
    return calculateResult
}
```
처음 calculateResult를 생성한 경우 0.0으로 초기화 해주었는데 이 경우 처음 calculate할 값으로 0.0을 사용하여 operator와 operand의 짝이 맞지 않게 됨.

##### 🛠️ 해결 방법
```swift
mutating func result() -> Double {
    var calculateResult = operands.dequeue()
        
    while let operand = operands.dequeue() {
        guard let `operator` = operators.dequeue() else {
                return .nan
            }
            
        calculateResult = `operator`.calculate(lhs: calculateResult, rhs: operand)
    }
        
    return calculateResult
}
```
calculateResult 생성 시 초기 값을 operands의 dequeue값 으로 설정하여 문제 해결

#### ❗️시간복잡도를 고려한 인스턴스 메서드 선택
##### 📌 문제 상황
```swift
// String.swift
extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
```
서로의 코드를 비교하며 병합했을 때, 각각 다른 인스턴스 메서드를 사용하여 구현한 부분이 있어 어느 방법을 채택할까 고민을 했습니다.
 위의 방법에서는 split()을 수행한 뒤, map()을 수행하는 로직이라 O(n)의 시간복잡도가 걸리는 메서드를 두 번 실행합니다.

##### 🛠️ 해결 방법
```swift
// String.swift
extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
```
 위의 코드에서는 String으로 형변환한 값을 components(separatedBy:)의 인스턴스 메서드를 수행하기 때문에 시간복잡도가 O(n)으로 완료됩니다. 따라서, components 인스턴스 메서드를 활용한 코드로 수정했습니다.

### 6. 팀 회고
#### 😍 우리팀이 잘한 점
1. 프로젝트를 진행하면서 꾸준히 소통
2. 코드 작성 전 충분히 공부하는 시간을 가짐

#### 💦 우리팀 개선할 점
1. 일정을 맞추지 못해 프로젝트 완성이 안됨 ㅠ
2. 예외처리에 대한 내용을 디테일하게 검토하지 않음

#### 😊 서로에게 좋았던 점 피드백
1. Diana: 그레이가 일정이 빡빡한데 열심히 준비하고 포기하지 않고 STEP2까지 완료해주어서 병합하기 원활했습니다~ 😌
2. Gray: 코드를 작성하는데 연습이 될 수 있도록 반복 학습 할 수 있도록 기회와 힌트를 주신 점이 매우 좋았습니다! 덕분에 빠른 시간에 진도를 쫓아갈 수 있었습니다~ 😇

#### 💦 자신에게 아쉬웠던 점
1. Diana: 휴일이 껴있기는 했지만 일정을 맞추지 못해 STEP3를 완성하지 못한 점이 아쉽습니다.
2. Gray: 건강 관리에 신경쓰지 못해 매우 늦게 프로젝트를 시작하게 되었고, 멘탈 관리의 필요성을 느꼈습니다. 코드 작성의 기초단계가 탄탄하지 못하다고 느꼈습니다.

### 7. 참고 자료
📍[Apple, Swift documentation, Enumeration](<https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/>)  
📍[Apple, Swift documentation, Double](<https://developer.apple.com/documentation/swift/double>)  
📍[그린, Tistory, Swift split vs component 차이](<https://green1229.tistory.com/318>)  
📍[jeonyeohun, Tistory, 스위프트로 구현하는 자료구조 2: 링크드 리스트(Linked List)](<https://jeonyeohun.tistory.com/320>)  
📍[HeeJeong Kwon, Github, [자료구조] 큐(Queue)란](<https://gmlwjd9405.github.io/2018/08/02/data-structure-queue.html>)  
📍[Apple, Swift documentation, replacingOccurrences(of:with:)](<https://developer.apple.com/documentation/foundation/nsstring/1412937-replacingoccurrences>)  
📍[ZeddiOS, Tistory, String쪼개기](<https://zeddios.tistory.com/74>)


