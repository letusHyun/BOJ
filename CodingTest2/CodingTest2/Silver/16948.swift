//
//  16948.swift
//  데스나이트
//
//  Created by SeokHyun on 2/27/24.
//

let n = Int(readLine()!)!
let r = readLine()!.split{$0==" "}.map{Int(String($0))!}
let r1 = r[0], r2 = r[1], r3 = r[2], r4 = r[3]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
let dx = [-2, -2, 0, 0, 2, 2]
let dy = [-1, 1, -2, 2, -1, 1]

bfs(r1, r2, 0)

func bfs(_ startX: Int, _ startY: Int, _ count: Int) {
  var queue = [(Int, Int, Int)]()
  visited[startY][startX] = true
  queue.append((startX, startY, count))
  var index = 0
  
  while queue.count > index {
    let (cx, cy, curCount) = queue[index]
    if cx == r3, cy == r4 { // 원하는 위치로 이동한 경우
      print(curCount)
      return
    }
    
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      
      if nx >= 0, nx < n,
         ny >= 0, ny < n,
         !visited[ny][nx] {
        visited[ny][nx] = true
        queue.append((nx, ny, curCount+1))
      }
    }
    index += 1
  }
  print(-1) // 이동할 수 없는 경우
}

// MARK: - Note
/*
 최소 이동 횟수 구하기 -> bfs 적용
 */
