//
//  2573.swift
//  빙산
//
//  Created by SeokHyun on 2/8/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: height, m: width
var graph = Array(repeating: [Int](), count: n)
_=(0..<n).map{graph[$0]=readLine()!.split{$0==" "}.map{Int(String($0))!}}
var copy = Array(repeating: Array(repeating: 0, count: m), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var time = 0

func meltIce() {
  // 상하좌우 0의 개수 counting해서 copy에 저장
  for i in 1..<n-1 {
    for j in 1..<m-1 {
      
      for k in 0..<dx.count {
        let nx = dx[k] + j
        let ny = dy[k] + i
        if graph[i][j] != 0, graph[ny][nx] == 0 {
          copy[i][j] += 1
        }
      }
    }
  }
  
  for i in 1..<n-1 {
    for j in 1..<m-1 {
      graph[i][j] = max(0, graph[i][j]-copy[i][j])
    }
  }
}

func bfs(_ x: Int, _ y: Int) {
  var queue = [(Int, Int)]()
  queue.append((x,y))
  visited[y][x] = true
  var index = 0
  
  while queue.count > index {
    let (cx, cy) = queue[index]
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      
      if graph[ny][nx] != 0, !visited[ny][nx] {
        visited[ny][nx] = true
        queue.append((nx, ny))
      }
    }
    index += 1
  }
}

while true {
  meltIce()
  var count = 0
  for i in 1..<n-1 {
    for j in 1..<m-1 {
      if !visited[i][j], graph[i][j] != 0 {
        count += 1
        bfs(j, i)
      }
    }
  }
  
  time += 1
  if count > 1 { // 빙산이 분리되었다면
    print(time)
    break
  } else if count == 0 { // 빙산이 전부 녹았다면
    print(0)
    break
  }
  visited = Array(repeating: Array(repeating: false, count: m), count: n)
  copy = Array(repeating: Array(repeating: 0, count: m), count: n)
}

// MARK: - Note
/*
 1. 자리별 상하좌우 0의 개수 counting해서 저장
 2. counting값을 graph에서 빼주기
 3. bfs를 사용해서 분리되는지 확인
 */
