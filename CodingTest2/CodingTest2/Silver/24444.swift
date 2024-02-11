//
//  24444.swift
//  알고리즘수업 - 너비우선탐색1
//
//  Created by SeokHyun on 2/11/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var adjList = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: 0, count: n+1) // 방문여부 && 순서 서장
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}
var order = 1
dfs(r)
print(visited.map{String($0)}.dropFirst().joined(separator: "\n"))

func dfs(_ startIndex: Int) {
  visited[startIndex] = order
  var queue = [Int]()
  queue.append(startIndex)
  
  var index = 0
  while queue.count > index {
    let dequeue = queue[index]
    for v in adjList[dequeue].sorted(by: <) { // 오름차순 순회
      if visited[v] == 0 {
        order += 1
        visited[v] = order
        queue.append(v)
      }
    }
    index += 1
  }
}

// MARK: - Note
/*
 - dfs 탐색
 - queue가 빌 때까지 while문 반복이지만, queue.isEmpty를 조건으로 사용하면 dequeue를 removeFirst()로 사용하는데 이는 dequeue연산의 시간복잡도가 O(N)이 되는 문제 발생
    - 대안으로 index 변수를 만들어서 queue.count가 index보다 큰 경우에만 while문을 반복하고, dequeue 연산을 index로 접근해서 dequeue된 값을 가져오는 방식 채택
      - 시간복잡도: O(1)
 */
