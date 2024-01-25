//
//  1182.swift
//  부분수열의 합
//
//  Created by SeokHyun on 1/20/24.
//

let ns = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = ns[0]
let s = ns[1]
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
var result = 0

func dfs(_ index: Int, _ sum: Int, _ count: Int) {
  if index == n {
    if sum == s, count > 0 {
      result += 1
    }
    
    return
  }
  
  dfs(index+1, sum+arr[index], count+1) // 노드 선택 o
  dfs(index+1, sum, count) // 노드 선택 x
}

dfs(0, 0, 0)
print(result)

// MARK: - Note
/*
 이진 트리 문제
 - 원소를 선택하는 경우와, 원소를 선택하지 않는 경우
 - sum을 인자로 전달하는데, sum의 초기값은 0이다. 이때 원소를 전부 선택하지 않으면 sum이 0인데, result가 counting되는 경우가 있다. 이를 방지하기 위해서 count인자를 추가해서 모든 원소를 선택하지 않았는데, s가 0이라 result가 counting되는 것을 방지해야 한다.
 */
