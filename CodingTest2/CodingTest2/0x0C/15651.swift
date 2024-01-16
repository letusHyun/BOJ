//
//  15651.swift
//  N과M(3)
//
//  Created by SeokHyun on 1/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var result = Array(repeating: "", count: m)

func bt(_ index: Int) {
  if index == m {
    print(result.joined(separator: " "))
    return
  }
  
  for i in 1..<n+1 {
    result[index] = "\(i)"
    bt(index+1)
  }
}

bt(0)
