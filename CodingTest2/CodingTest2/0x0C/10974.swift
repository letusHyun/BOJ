//
//  10974.swift
//  모든 순열
//
//  Created by SeokHyun on 1/20/24.
//

let n = Int(readLine()!)!
var result = Array(repeating: 0, count: n)
var isVisited = Array(repeating: false, count: n)

func bt(_ index: Int) {
  if index == n {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for i in 0..<n {
    if !isVisited[i] {
      result[index] = i+1
      isVisited[i] = true
      bt(index+1)
      isVisited[i] = false
    }
  }
}

bt(0)
