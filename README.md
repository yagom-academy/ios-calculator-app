# 계산기II README
> 프로젝트 기간 2022/10/03 ~ 2022/10/07
> 팀원: [Mangdi](https://github.com/MangDi-L), [Jeremy](https://github.com/yjjem) / 리뷰어: [hyunable](https://github.com/hyunable)

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [타임라인](#타임라인)
- [트러블 슈팅](#트러블-슈팅)

## 프로젝트 소개
> 개인으로 진행한 계산기I 프로젝트를 이번 계산기II프로젝트에서 서로 작성한 코드에 대해 설명하며 병합하는 과정을 거치고 리팩토링을 진행했다.


## 개발환경 및 라이브러리
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

## 타임라인
### 1주차
- 10/03 ~
    - 병합을 어떤식으로 진행할지 결정
- 10/05 ~
    - 코드가 서로 맞물리게 수정 및 병합 완료
- 10/07 ~
    - 리팩토링 진행

## 트러블 슈팅
![](https://i.imgur.com/1i94S3v.png)
**Mangdi**: componentsByOperators메서드에서 사칙연산기호들을 기준으로 피연산자배열을 만들고 parse메서드에서 Operator에 해당하는 연산자들을 배열로 만들어서 각각 큐에 넣어주었다. String extention X
"1+2+3" (연산자기준나눔)-> [1, 2, 3] operand큐에 삽입
"1+2+3" (연산자에해당한것추출)-> [+,+] operator큐에 삽입

**Jeremy**: componentsByOperators메서드에서 빗금(/)을 기준으로 연산자와 피연산자배열을 만들고 parse메서드에서 각각 operator큐와 operand큐에 넣어주었다. String extension 활용.

input: String = "1/+/2/+/3" 문자열 "/" 기준으로 나눔 -> [1, +, 2, +, 3]
opernad: [Double] = [1, 2 ,3] -> operands.enqueue()
operator: [Operator] = [+, +] -> operator.enqueue()

**Mangdi**의 방식으로 갈경우 숫자의 부호(ex -10)를 따로처리해주는기능을 만들어주어야하기때문에 **Jeremy**의 방식을 적용했다.


### 😮알게 된 점
리팩토링을 진행할때 코드를 보며 의문에 생겼다. 코드가 짧지만 한눈에 알아보기힘든 코드와 코드가 길지만 한눈에 알아보기쉬운코드중에 어떠한 방식으로 리팩토링을 진행하는것이 좋은가 고민이 되었다. hyunable(리뷰어)은 이부분에 대해 명쾌한 답을 내주셨다. 우선 이 코드가 어떤 로직이고 무슨 역할을 하는지에 대해 명확해야 협업자가 해당 로직을 변경하거나 추가가 가능하기때문에 코드가 길어지더라도 알아보기쉬운 방향을 추천해주셨다. 
