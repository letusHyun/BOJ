//
//  1914.swift
//  하노이 탑
//
//  Created by SeokHyun on 1/26/24.
//

import Foundation

let n = Int(readLine()!)!
var result = ""
func hanoi(_ n: Int, _ from: Int, _ temp: Int, _ to: Int) {
  if n == 1 {
    result += String(from) + " " + String(to) + "\n"
    return
  }
  
  hanoi(n-1, from, to, temp)
  result += String(from) + " " + String(to) + "\n"
  hanoi(n-1, temp, from, to)
}

if n <= 20 {
  hanoi(n, 1, 2, 3)
}
print(pow(2,n)-1)
print(result)

