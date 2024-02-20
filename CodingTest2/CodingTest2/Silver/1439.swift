//
//  1439.swift
//  뒤집기
//
//  Created by SeokHyun on 2/20/24.
//

let s = readLine()!.map{String($0)}
var stack = [String]()
for char in s {
  if stack.isEmpty {
    stack.append(char)
  } else {
    let last = stack.last!
    if last == char { // 스택의 last와 순회 문자가 같다면
      continue
    } else {
      stack.append(char)
    }
  }
}
var count = Array(repeating: 0, count: 2)

while !stack.isEmpty {
  let last = Int(stack.popLast()!)!
  if last == 0 {
    count[0] += 1
  } else {
    count[1] += 1
  }
}
if count[0] == 0 || count[1] == 0 {
  print(0)
} else {
  print(min(count[0], count[1]))
}

// MARK: - Note
/*
 - stack 이용
  - 문자열을 순회해서 stack에 push 진행
    - push: 다른 문자열을 만났을 때 or stack이 비었을 때
  - pop: 순회가 끝나고, pop 0 또는 1의 개수를 counting 할 때 사용
  
 - 0 출력
    - 000000, 000, 0, ...
      - stack에 0만 존재하는 경우
    - 111111, 111, 1, ...
      - stack에 1만 존재하는 경우
 - min(count[0], count[1]) 출력
    - 문자열 순회가 끝나고 stack에 존재하는 0과 1의 count를 각각 센 후, 최솟값을 출력
 */
