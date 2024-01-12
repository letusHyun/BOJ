//
//  5297.swift
//  키로거
//
//  Created by SeokHyun on 1/10/24.
//

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
  var lBuffer = [String]()
  var rBuffer = [String]()
  let strArr = readLine()!.map{String($0)}
  var result = ""
  
  for char in strArr {
    if char == "<" {
      if let last = lBuffer.popLast() {
        rBuffer.append(last)
      }
    } else if char == ">" {
      if let last = rBuffer.popLast() {
        lBuffer.append(last)
      }
    } else if char == "-" {
      _ = lBuffer.popLast() // removeLast() 사용 시, 런타임 에러 발생 주의
    } else {
      lBuffer.append(char)
    }
  }
  
  var reversedLBuffer = Array(lBuffer.reversed()) // reversed(): O(1), reverse(): O(N)
  while let char = reversedLBuffer.popLast() {
    result += char
  }
  while let char = rBuffer.popLast() {
    result += char
  }
  print(result)
}
