//
//  1759.swift
//  암호만들기
//
//  Created by SeokHyun on 1/21/24.
//

func dfs(_ index: Int, _ vowelCount: Int) {
  if index == c {
    if result.count == l, vowelCount >= 1, l-vowelCount >= 2 {
      print(result.joined())
    }
    return
  }
  
  // element를 포함하는 경우
  if arr[index] == "a" ||
      arr[index] == "e" ||
      arr[index] == "i" ||
      arr[index] == "o" ||
      arr[index] == "u" { // 모음인 경우
    result.append(arr[index])
    dfs(index+1, vowelCount+1)
    _=result.popLast()
  } else { // 자음인 경우
    result.append(arr[index])
    dfs(index+1, vowelCount)
    _=result.popLast()
  }
  
  // element를 포함하지 않는 경우
  dfs(index+1, vowelCount)
}

let lc = readLine()!.split{$0==" "}.map{Int(String($0))!}
let l = lc[0] // 암호 개수
let c = lc[1] // 주어진 알파벳 개수
let arr = readLine()!.split{$0==" "}.map{String($0)}.sorted()
var result = [String]()
var vowelCount = 0

dfs(0,0)

// MARK: - Note
 // 이진탐색트리 구현
  // - 포함하는 경우와 포함하지 않는 경우로 구분
  // - 포함하는 경우에서는 자음인 경우와 모음인 경우를 구분
