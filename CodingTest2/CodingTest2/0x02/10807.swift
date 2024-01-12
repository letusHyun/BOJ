//
//  10807.swift
//  CodingTest2
//
//  Created by SeokHyun on 1/10/24.
//

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let v = Int(readLine()!)!

var result = 0

for i in arr {
  if i == v {
    result += 1
  }
}

print(result)
