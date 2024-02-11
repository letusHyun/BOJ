//
//  24446.swift
//  알고리즘수업 - 너비우선탐색3
//
//  Created by SeokHyun on 2/11/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var adjList = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1) // 방문 여부
var depths = Array(repeating: -1, count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}

bfs(r)
print(depths.map{String($0)}.dropFirst().joined(separator: "\n"))

func bfs(_ startIndex: Int) {
  var queue = [(Int, Int)]()
  queue.append((startIndex, 0))
  visited[startIndex] = true
  var index = 0
  while queue.count > index {
    let (currentVertex, depth) = queue[index] // dequeue
    depths[currentVertex] = depth // 1. depth를 저장하는 시점
    for v in adjList[currentVertex] {
      if !visited[v] { // 방문한 적 없다면
        visited[v] = true // 2. 방문처리 시점
        queue.append((v, depth+1))
      }
    }
    index += 1
  }
}

// MARK: - Note
/*
 - bfs의 경우 enqueue시, 현재 vertex의 depth를 같이 넣어주고
   dequeue할 때 만약 해당 vertex로부터 연결된 vertex를 순회하면서 방문한 적 없는 vertex가 있다면 depth+1을 enqueue해준다.
 
 - visited배열에 방문처리와 depth를 저장하는 기능을 동시에 처리하고 싶었지만,
   해당 문제같은 경우엔 방문처리와 depth 저장 처리의 시점이 같으면 semantics error가 발생하므로, 별도로 분리시킴
    - 1. depth 저장 시점: dequeue된 데이터를 기반으로 저장해야하기 때문에 dequeue 직후 시점
    - 2. 방문 처리 시점: 방문처리는 enqueue하기 직전에 해주어야, dequeue 이후 방문 처리한 것보다 성능이 좋음 (중복 방지)
 */
