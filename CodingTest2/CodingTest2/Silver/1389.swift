//
//  1389.swift
//  케빈 베이컨의 6단계 법칙
//
//  Created by SeokHyun on 2/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: 유저 수, m: 친구 관계 수
var adjList = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var result = Array(repeating: 0, count: n+1)
_=(0..<m).map{ _ in
  let users = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[users[0]].append(users[1])
  adjList[users[1]].append(users[0])
}
for i in 1..<n+1 {
  bfs(i)
  visited = Array(repeating: false, count: n+1)
}

func bfs(_ n: Int) {
  visited[n] = true
  var queue = [(Int, Int)]()
  queue.append((n, 0))
  var index = 0
  
  while queue.count > index {
    let (user, count) = queue[index]
    result[n] += count
    for v in adjList[user] {
      if !visited[v] {
        visited[v] = true
        queue.append((v, count+1))
      }
    }
    index += 1
  }
}

var minIndex = 1
for i in 2..<n+1 {
  if result[i] < result[minIndex] {
    minIndex = i
  }
}
print(minIndex)

// MARK: - Note
/*
 - bfs를 통한 누적 counting 저장
 */
