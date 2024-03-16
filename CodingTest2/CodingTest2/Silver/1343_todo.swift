//
//  1343.swift
//  폴리오미노
//
//  Created by SeokHyun on 3/7/24.
//

let board = readLine()!

var buffer = ""
var result = ""


for char in board {
  if char == "X" {
    buffer += String(char)
  } else { // "."
    if buffer.isEmpty { // 연속된 "."이라면
      result += "."
      continue
    } else { // "알파벳 이후 "."이라면
      if buffer.count % 4 == 2 {
        for _ in 0..<(buffer.count / 4) {
          result += "AAAA"
        }
        result += "BB"
      } else if buffer.count % 2 == 0 {
        result += "BB"
      }
      result += "."
      buffer = "" // buffer 초기화
    }
  }
}

if !buffer.isEmpty { // 입력에 .이 존재하지 않았다면
  print(result)
} else {
  print(buffer)
}

// MARK: - Note
/*
 - .은 .으로 출력
 - if: 4로 나누었을 때 나머지가 2이면, 몫*4*A + 2*B
 - else if: 2로 나누었을 때 나머지가 0이면, 2*B
 - else: -1출력 후, 강제 종료
 */
