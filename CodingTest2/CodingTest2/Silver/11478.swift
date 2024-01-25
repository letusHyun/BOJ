//
//  11478.swift
//  서로 다른 부분 문자열의 개수
//
//  Created by SeokHyun on 1/21/24.
//

let s = readLine()!.map{String($0)}
var set = Set<String>()
var buffer = ""

for i in 0..<s.count {
  for j in i..<s.count {
    buffer += s[j]
    set.insert(buffer)
  }
  buffer = ""
}

print(set.count)

// MARK: - Note
/*
 - Set은 중복이 없고, 순서가 없다.
 
 - input: ababc
  - 1. a b a b c
  - 2. ab ba ab bc
  - 3. aba bab abc
  - 4. abab babc
  - 5. ababc
 
 여기서 column으로 보면 더 쉽게 접근 가능하다.
 ex) 첫 번째 열: a ab aba abab ababc
     두 번째 열: b ba bab babc
 ...
 
 - 2중 for문 구현
 */
