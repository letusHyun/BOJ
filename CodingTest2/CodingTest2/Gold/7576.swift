//
//  7576.swift
//  토마토
//
//  Created by SeokHyun on 3/2/24.
//

import Foundation

let mn = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = mn[0], n = mn[1] // m: 가로, n: 세로
// -1: 토마토 없음, 0: 익지 않은 토마토, 1: 익은 토마토
var graph = Array(repeating: [Int](), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var queue = [(Int, Int, Int)]() // x, y, count
var maxCount = Int.min
var alreadyRipen = true
for i in 0..<n {
  graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
  for j in 0..<m { // 초기 익은 토마토의 위치를 enqueue
    if graph[i][j] == 1 {
      queue.append((j, i, 0))
    } else if graph[i][j] == 0 { // 전부 익어있는 상태가 아님
      alreadyRipen = false
    }
  }
}

if alreadyRipen {
  print(0)
  exit(0)
}

bfs()

func bfs() {
  var index = 0
  while queue.count > index {
    let (cx, cy, curCount) = queue[index] // dequeue
    maxCount = max(curCount, maxCount)
    for i in 0..<dx.count {
      let nx = cx + dx[i]
      let ny = cy + dy[i]
      if nx >= 0, nx < m,
         ny >= 0, ny < n,
         graph[ny][nx] == 0 {
        queue.append((nx, ny, curCount+1))
        graph[ny][nx] = 1
      }
    }
    index += 1
  }
}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 0 {
      print(-1)
      exit(0)
    }
  }
}

print(maxCount)

// MARK: - Note
/*
 - 초기 익은 토마토의 위치를 enqueue
 - bfs
 
 - 초기 전부 익은 상태가 아님을 확인하기 위해 input 받을 때, 익지 않은 토마토가 하나라도 있으면 전부 익은 상태가 아님을 표시
 - bfs 끝나고 아직도 안익은 토마토가 있는지 확인
 
 - 위 두 로직을 거치고도 종료되지 않았다면 토마토는 bfs 이후 전부 익은 상태이므로, maxCount 출력
 */
