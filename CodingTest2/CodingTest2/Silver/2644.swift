//
//  2644.swift
//  촌수 계산
//
//  Created by SeokHyun on 1/28/24.
//

let n = Int(readLine()!)!
let nums = readLine()!.split{$0==" "}.map{Int(String($0))!}
let start = nums[0], end = nums[1]
let m = Int(readLine()!)!
var relation = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: -1, count: n+1)
_=(0..<m).map{ _ in
  let xy = readLine()!.split{$0==" "}.map{Int(String($0))!}
  relation[xy[0]].append(xy[1])
  relation[xy[1]].append(xy[0])
}

dfs(start, 0)
print(visited[end])

func dfs(_ startIndex: Int, _ count: Int) {
  visited[startIndex] = count
  
  if startIndex == end {
    return
  }
  
  for v in relation[startIndex] {
    if visited[v] == -1 {
      
      dfs(v, count+1)
    }
  }
}

// MARK: - Note
/*
 startNode로부터 edge를 넘어갈때마다 counting
 visited의 초기값을 -1로 처리해줘서 방문표시를 -1로 하고, 방문했다면 방문처리로 count값을 넣어줌
 */
