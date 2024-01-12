//
//  10808.swift
//  CodingTest2
//
//  Created by SeokHyun on 1/10/24.
//

let s = readLine()!.map { String($0) }
var buffer = Array(repeating: 0, count: 26)
for alphabet in s {
  buffer[Int(UnicodeScalar(alphabet)!.value)-97] += 1
}

print(buffer.map { String($0) }.joined(separator: " "))
