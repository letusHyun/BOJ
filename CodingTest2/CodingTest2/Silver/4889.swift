//
//  4889.swift
//  안정적인 문자열
//
//  Created by SeokHyun on 2/15/24.
//

var order = 1

while true {
  var stack = [String]()
  let input = readLine()!
  if input.contains("-") { break }
  var count = 0
  
  for alphabet in input {
    let curChar = String(alphabet)
    
    if curChar == "{" {
      stack.append("{")
    } else { // }
      if !stack.isEmpty, stack.last! == "{" {
        stack.removeLast()
      } else { // 스택이 비어있거나, stack.last가 "}"인 경우
        stack.append("}")
      }
    }
  }
  
  if !stack.isEmpty { // stack이 비어있지 않은 경우
    for i in stride(from: 0, to: stack.count, by: 2) { // stack에는 짝수개의 element가 있음이 보장됨
      if stack[i] == stack[i+1] { // "}}" or "{{"
        count += 1
      } else { // "}{"
        count += 2
      }
    }
  }
  // stack이 비어있는 경우는 count가 0
  print("\(order). \(count)")
  order += 1
}

// MARK: - Note
/*
 - 안정적인 문자열만 제거해서 stack에 불완전한 문자열을 저장
  - 불완전한 문자열은 "{{", "}}", "}{" 3가지 존재
  - 이들을 안전한 문자열로 바꾸면서 counting
    - "{{" or "}}"의 경우, 한번만 counting
    - "}{"의 경우, 두번 counting
 */
