//
//  15663.swift
//  N과M(9)
//
//  Created by SeokHyun on 1/17/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var isVisited = Array(repeating: false, count: n)
var result = [Int]()
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()

func bt(_ index: Int) {
  if m == index {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  var prev = 0
  for i in 0..<n {
    if !isVisited[i], prev != arr[i] {
      isVisited[i] = true
      result.append(arr[i])
      prev = arr[i]
      bt(index+1)
      isVisited[i] = false
      _=result.popLast()
    }
  }
}

bt(0)
