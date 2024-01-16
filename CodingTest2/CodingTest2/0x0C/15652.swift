//
//  15652.swift
//  N과M(4)
//
//  Created by SeokHyun on 1/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var result = Array(repeating: "", count: m)
func bt(_ at: Int, _ index: Int) {
  if index == m {
    print(result.joined(separator: " "))
    return
  }
  
  for i in stride(from: at, through: n, by: 1) {
    result[index] = "\(i)"
    bt(i, index+1)
  }
}

 bt(1, 0)
