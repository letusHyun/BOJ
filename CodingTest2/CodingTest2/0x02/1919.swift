//
//  1919.swift
//  애너그램 만들기
//
//  Created by SeokHyun on 1/10/24.
//

let str1 = readLine()!.map { String($0) }
let str2 = readLine()!.map { String($0) }
var buffer1 = Array(repeating: 0, count: 26)
var buffer2 = Array(repeating: 0, count: 26)
var result = 0

for char in str1 {
  buffer1[Int(UnicodeScalar(char)!.value-97)] += 1
}

for char in str2 {
  buffer2[Int(UnicodeScalar(char)!.value-97)] += 1
}

for i in 0..<buffer1.count {
  result += abs(buffer1[i] - buffer2[i])
}tjems

print(result)
