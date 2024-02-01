//
//  1991.swift
//  트리 순회
//
//  Created by SeokHyun on 1/30/24.
//

let n = Int(readLine()!)!
// col 0: left, col 1: right
var graph = Array(repeating: Array(repeating: 0, count: 2), count: 26)
var result = Array(repeating: "", count: 3)

for _ in 0..<n {
  let nodes = readLine()!.split{$0==" "}.map{String($0)}
  let parents = Int(UnicodeScalar(nodes[0])!.value)-65
  let left = nodes[1], right = nodes[2]
  if left == "." {
    graph[parents][0] = -1
  } else {
    graph[parents][0] = Int(UnicodeScalar(left)!.value)-65
  }
  if right == "." {
    graph[parents][1] = -1
  } else {
    graph[parents][1] = Int(UnicodeScalar(right)!.value)-65
  }
}

preOrder(0)
inOrder(0)
postOrder(0)

for i in 0..<result.count {
  print(result[i])
}

func preOrder(_ node: Int) {
  if node == -1 {
    return
  }
  result[0] += String(UnicodeScalar(node + 65)!)
  preOrder(graph[node][0]) // left
  preOrder(graph[node][1]) // right
}

func inOrder(_ node: Int) {
  if node == -1 {
    return
  }
  inOrder(graph[node][0]) // left
  result[1] += String(UnicodeScalar(node + 65)!)
  inOrder(graph[node][1]) // right
}

func postOrder(_ node: Int) {
  if node == -1 {
    return
  }
  postOrder(graph[node][0]) // left
  postOrder(graph[node][1]) // right
  result[2] += String(UnicodeScalar(node + 65)!)
}
