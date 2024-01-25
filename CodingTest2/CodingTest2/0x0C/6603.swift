//
//  6603.swift
//  로또
//
//  Created by SeokHyun on 1/21/24.
//

func bfs(index: Int, startIndex: Int, arr: inout [Int]) {
  if index == 6 {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for i in stride(from: startIndex, to: arr.count, by: 1) {
    result.append(arr[i])
    bfs(index: index+1, startIndex: i+1, arr: &arr)
    _=result.popLast()
  }
}

var result = [Int]()

while let testCase = readLine(), testCase != "0" {
  defer { result.removeAll() }
  
  let ks = testCase.split{$0==" "}.map{Int(String($0))!}
  let k = ks[0]
  var arr = (1...k).map { ks[$0] }
  bfs(index: 0, startIndex: 0, arr: &arr)
  print()
}
