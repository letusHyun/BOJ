//
//  1316.swift
//  그룹 단어 체커
//
//  Created by SeokHyun on 2/19/24.
//

let n = Int(readLine()!)!
var result = 0
for _ in 0..<n {
  var stack = [String]()
  let str = readLine()!.map{String($0)}
  let check = Set<String>(str)
  
  for char in str {
    if stack.isEmpty {
      stack.append(char)
    } else {
      if stack.last! != char {
        stack.append(char)
      } else {
        continue
      }
    }
  }
  
  if stack.count == check.count {
    result += 1
  }
}
print(result)

// MARK: - Note
/*
 - Stack과 Set 활용
 */
