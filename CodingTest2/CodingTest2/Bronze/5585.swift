//
//  5585.swift
//  거스름돈
//
//  Created by SeokHyun on 3/7/24.
//

var makeZero = 1000 - Int(readLine()!)!
let moneys = [500, 100, 50, 10, 5, 1]
var count = 0
for money in moneys {
  while makeZero - money >= 0 {
    makeZero -= money
    count += 1
  }
}
print(count)
