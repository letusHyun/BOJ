//
//  1068.swift
//  트리
//
//  Created by SeokHyun on 2/8/24.
//

let n = Int(readLine()!)!
let parents = readLine()!.split{$0==" "}.map{Int(String($0))!}
let removeNode = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: -1, count: 2), count: n) // col 0: left node, col 1: right node
var count = 0
for (index, node) in parents.enumerated() {
  if node != -1 {
    if graph[node][0] == -1 {
      graph[node][0] = index
    } else {
      graph[node][1] = index
    }
  }
}

for i in 0..<n {
  for j in 0...1 {
    if graph[i][j] == removeNode {
      graph[i][j] = -1 // 해당 노드의 edge에 자식이 달려있지 않음을 표시
    }
  }
}

dfs(removeNode)

for i in 0..<n {
  if graph[i].allSatisfy({$0 == -1}) {
    count += 1
  }
}

print(count)

func dfs(_ node: Int) {
  for i in 0...1 {
    if graph[node][i] != -1 {
      dfs(graph[node][i])
    } else {
      graph[node][i] = 0
    }
  }
}

// MARK: - Note
/*
 - 리프노드 확인 방법: 해당 노드의 l과 r이 -1이면 리프노드
  - row가 node, col이 left자식, right자식을 저장하는 graph 배열 정의 및 초기화
  - removeNode를 부모와의 edge로부터 -1로 표시해두고,
  - removeNode의 자식노드들 left right을 0으로 표시
    - 이때 dfs 적용
    - 0으로 표시한 노드들은 삭제된 노드임을 나타냄
  - left와 right 모두 -1인 노드의 개수 counting
 */
