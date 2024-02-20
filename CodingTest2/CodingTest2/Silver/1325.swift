//
//  1325.swift
//  효율적인 해킹
//
//  Created by SeokHyun on 2/18/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: 컴퓨터 번호, m: 관계 개수
var adjList = Array(repeating: [Int](), count: n+1)
var count = Array(repeating: 0, count: n+1)
_=(0..<m).map{ _ in
  let computers = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[computers[1]].append(computers[0])
}
var maxValue = Int.min
for i in 1..<n+1 {
  count[i] = bfs(i)
  maxValue = max(maxValue, count[i])
  
}

var result = ""

for i in 1..<n+1 {
  if count[i] == maxValue {
    result += "\(i) "
  }
}
print(result)

func bfs(_ computer: Int) -> Int {
  var visited = Array(repeating: false, count: n+1)
  visited[computer] = true
  var count = 1
  var queue = [Int]()
  queue.append(computer)
  var index = 0
  
  while queue.count > index {
    let curCom = queue[index] // dequeue
    
    for v in adjList[curCom] {
      if !visited[v] {
        visited[v] = true
        queue.append(v) // enqueue
        count += 1
      }
    }
    index += 1
  }
  
  return count
}

// MARK: - Note
/*
 bfs의 경우 counting을 enqueue 혹은 dequeue시에 해주면 됨
 */
