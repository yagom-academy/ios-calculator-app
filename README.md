# 계산기II
> 배정된 짝궁과 코드를 합칩니다.
> GitHub에서 모둠원 중 한명의 저장소에서 다른 한 명을 콜라보레이터로 등록하여 진행합니다.
> 기존의 코드를 리팩터링 합니다.
> 제네릭을 활용하여 큐를 범용적인 타입으로 구현해봅니다.

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)
- [팀 회고](#-팀-회고)

## 🧑‍💻 팀원 소개
| <img src="https://github.com/devKobe24/images/blob/main/79740398.jpeg?raw=true" width="200"/> | <img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/> |
| :-: | :-: |
| [**Minsup**](https://github.com/agilestarskim) | [**Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.06.12.(월) ~ 23.06.16.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.06.12.(월)     | 방향성에 대한 회의<br/>각자의 코드 설명<br/> |
| 23.06.13.(화)     | 스탭3 부분에 대한 회의<br/> 스탭 3 조건과 병합 과정에 대한 회의<br/>     |
| 23.06.14.(수)     | 스탭 2부분 병합 시작<br/> 스탭 2 오류 발견 및 리팩토링<br/>|
| 23.06.15.(목)     | 스탭 2 Feature 전체 삭제<br/> 스탭 2 Feature 다시 시작<br/>|
| 23.06.16.(금)     | 스탭 2 병합<br/> 스탭 3 병합<br/> 코드 리팩토링<br/>README 작성<br/>    |

## 📺 실행화면
- 계산기 실행화면 <br>
![](https://github.com/devKobe24/images/blob/main/Jun-16-2023%2007-39-03.gif?raw=true)

## 🔨 트러블 슈팅 
1️⃣ **스탭이 달라 병합하는 과정** <br>
🔒 **문제점** <br>
진행이 완료된 스탭이 달라 병합을 어떻게 해야 할지 고민이 많았습니다.
민섭은 스탭 3까지 완료가 된 상태였으며 코비는 스탭 2까지 완료가 된 상황이였습니다.

🔑 **해결방법** <br>
링크드 리스트 방식으로 해결한 코비의 스탭 2까지의 코드를 병합한 뒤 스탭 3부분은 민섭의 코드를 가져와서 병합하는 방식으로 해결했습니다.


2️⃣ **Merge** <br>
🔒 **문제점 2** <br>
git merge 하는 과정에서 혼란이 있었습니다.
병합 하는 과정에 대한 정확한 개념 파악이 필요하다고 생각이 들었습니다.

🔑 **해결방법** <br>
- checkout한 브랜치를 기준으로 `-merged`, `-no-merged` 옵션을 사용하여 merge가 된 브랜치 인지 아닌지 필터링할 수 있는 방법을 학습 했습니다.
```
git branch --merged
git branch --no-merged
```

- '현재' 브랜치에서 **브랜치 명**의 변경사항을 병합 한다는 사실을 학습했습니다.

```
예를 들어 master 브랜치와 test 브랜치가 있다고 했을 경우,

git merge test를 하게되면 

test 브랜치에만 있던 코드가 master 브랜치에 병합됩니다.

// master애 체크아웃
git checkout master

// test 브랜티의 코드를 master에 병합
git merge test
```


3️⃣ **충돌** <br>
🔒 **문제점 3** <br>
병합 과정에서 충돌이 발생하였습니다.
그 과정에서 충돌을 어떻게 해결해야 하는지 고민을 했었습니다.


🔑 **해결방법** <br>
직접 Xcode 상에서 코드를 확인하였습니다 예를 들어 충돌이 난 파일을 ViewController.swift라고 한다면 그 파일로 직접 들어가 확인하였습니다.

```
<<<<<<<<<<<<HEAD
[현재 브랜치의 다른 파일 내용]
=============
[다른 브랜치의 파일 내용]
>>>>>>>>>>> 충돌나는 브랜피명 또는 commit 아이디
```

위와 같이 되어 있는 상황을 확인 하였으며 수정해야 할 부분 빼고 삭제 한 뒤 병합을 시도해 주었습니다.


🤔 **고민했던 점** <br>
스탭이 달라 어떻게 어디서 부터 병합을 해야할지 고민이 많았습니다.
처음에는 민섭의 더블 스택으로 구현한 계산기 로직으로 방향을 잡고 진행을 하였으나 스탭 3가 진행이 안된 코비의 진행속도가 많이 늦어져 프로젝트의 실제 목적과 방향성이 다르다고 생각하여 빠르게 방향성을 다시 잡고 코비의 링크드 리스트로 방향을 틀었습니다.
그래서 스탭 2부분 부터 코비의 코드를 병합하기 시작했고 그 부분에서 많은 고민과 시행착오가 있었던것 같습니다.
서로 다른 방식의 자료구조로 계산기를 구현했다보니 어떤 자료구조를 선택해서 계산기II를 진행해야 할지도 고민이 많았던것 같습니다.


## 📑 참고자료
- [프로토콜](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
- [익스텐션](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)
- [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
- [에러처리](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [클로저](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)
- [상속](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/)
- [제네릭](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)




## 📝 팀 회고
### 우리 팀
👍 활발한 의견 공유 <br>
👍 팀프로젝트 활동시간대를 정하여 개인 공부 시간에 영향 없도록 한 점 <br>
👍 각자의 부족한 부분을 서로 채워나간 점 <br>
👍 모르는 것이 있으면 부끄러워하지 않고 질문을 서슴없이 한 점 <br>
👍 어려운 상황이나 문제가 닥치면 함께 찾아보고 풀어나간 점 <br>

### 팀원 피드백
**To. Kobe** <br>
👍 본인의 코드에 대해 잘 설명해주셨습니다. <br>
👍 끝까지 포기하지 않고 스탭3까지 잘 마쳐주셨습니다. <br>
👍 시간 약속을 잘 지켜주셨습니다. <br>
👍 생각하지 못한 자료구조를 제안해주어 시야가 넓어졌습니다. <br>
👍 문서화의 실력이 뛰어납니다. <br>

**To. Minsup** <br>
👍 이해가 가지 않는 부분에 대해 여러차례 질문을 드려도 친절하게 답해주셨습니다. <br>
👍 제가 한 질문에 대한 답변을 저의 지식에 맞춰 잘 풀어 설명해주셨습니다. <br>
👍 의견 조율과 시간 조율에 대한 부분을 항산 먼저 맞춰주시고 배려해주셨습니다. <br>
👍 Swift에 대한 많은 방법론을 제시해주시고 배울점이 매우 많았습니다. <br>
👍 코드적인 부분에서 매우 많은 것을 배울수 있었습니다.. <br>
