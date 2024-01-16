//
//  15654.swift
//  N과M(5)
//
//  Created by SeokHyun on 1/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var result = [Int]()
var isVisited = Array(repeating: false, count: n)
var arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
arr.sort()

func bt(_ index: Int) {
  if index == m {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for (i, elem) in arr.enumerated() {
    if !isVisited[i] {
      isVisited[i] = true
      result.append(elem)
      bt(index+1)
      _ = result.popLast()
      isVisited[i] = false
    }
  }
}

bt(0)
