//
//  14888.swift
//  연산자 끼워넣기
//
//  Created by SeokHyun on 1/27/24.
//

let n = Int(readLine()!)!
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
// 0 1 2 3
// + - x /
let opsInput = readLine()!.split{$0==" "}.map{Int(String($0))!}
var operators = [String]()
var maxNum = -1000000001
var minNum = 1000000001

for (i, op) in opsInput.enumerated() {
  var count = 0
  while count != op {
    switch i {
    case 0:
      operators.append("+")
    case 1:
      operators.append("-")
    case 2:
      operators.append("*")
    case 3:
      operators.append("/")
    default: break
    }
    count += 1
  }
}

var visited = Array(repeating: false, count: operators.count)

func dfs(_ i: Int, _ result: Int) {
  if i == n {
    maxNum = max(maxNum, result)
    minNum = min(minNum, result)
    return
  }
  
  for j in 0..<operators.count {
    if !visited[j] {
      visited[j] = true
      
      switch operators[j] {
      case "+": dfs(i+1, result + arr[i])
      case "-": dfs(i+1, result - arr[i])
      case "*": dfs(i+1, result * arr[i])
      case "/":
        if result < 0 {
          dfs(i+1, -(abs(result) / arr[i]))
        } else {
          dfs(i+1, result / arr[i])
        }
      default: break
      }
      visited[j] = false
    }
  }
}

dfs(1, arr[0])

print(maxNum)
print(minNum)

// MARK: - Note
/*
 - 중복을 포함한 연산자를 operators배열에 추가
 - dfs, 인자로 계산결과와 다음 수의 index를 넘김
 - visited를 통해 방문 처리
 */
