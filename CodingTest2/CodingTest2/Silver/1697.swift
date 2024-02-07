//
//  1697.swift
//  숨바꼭질
//
//  Created by SeokHyun on 2/5/24.
//

let nk = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nk[0], k = nk[1] // n: 수빈 위치, k: 동생 위치
var visited = Array(repeating: false, count: 100_001)

bfs()

func bfs() {
  var queue = [(Int, Int)]() // 0: 이동한 점, 1: counting
  queue.append((n, 0))
  visited[n] = true
  
  var index = 0
  while queue.count > index {
    let (x, count) = queue[index]
    
    if x == k {
      print(count)
      break
    }
    
    for i in [-1, 1, x] {
      let nx = x + i
      
      if 0...100_000 ~= nx, !visited[nx] {
        visited[nx] = true
        queue.append((nx, count+1))
      }
    }
    index += 1
  }
}

// MARK: - Note
/*
 - 가장 빠른 시간 -> 최단시간 -> bfs
 - 중복으로 거치는 수가 존재하므로, 방문처리 필요
 - bfs queue
    - dequeue를 적용할 때 removeFirst를 사용하면 시간복잡도 O(N)이므로, removeFirst대신 index를 만들어서 index+=1해주는 방식 사용
      - index가 queue.count보다 작거나 같은경우에 queue가 비어있지 않은 상태
        즉, index가 queue.count보다 크면 queue가 비어져있는 상태
 */
