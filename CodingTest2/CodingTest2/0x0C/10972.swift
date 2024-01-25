//
//  10972.swift
//  다음 순열
//
//  Created by SeokHyun on 1/19/24.
//

let n = Int(readLine()!)!
var arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
var index = -1

if (1...n).reversed() == arr {
  print(-1)
} else {
  for i in (1..<n).reversed() {
    if arr[i-1] < arr[i] {
      index = i
      break
    }
  }

  var minIndex = index

  for i in index..<n {
    if arr[index-1] < arr[i], arr[i] < arr[minIndex] {
      minIndex = i
    }
  }

  arr.swapAt(index-1, minIndex)

  let resultArr = arr[..<index] + arr[index...].sorted()
  print(resultArr.map{String($0)}.joined(separator: " "))
}

/*
 1 2 3 4 5 6
 
 5 4 / 6 3 2 1
 
 "/"를 기반으로 오른쪽은 내림차순으로 이루어져 있다. 이때 내림차순이 끊기는 지점은 "4"이다. 이 다음 순열을 구하면 5 6 1 2 3 4 일 것이다. 이는 4와 6을 swap한 후에 오른쪽에 있는 순열을 오름차순으로 변경해주면 된다. 즉, 5 6 / 4 3 2 1 -> 5 6 / 1 2 3 4 가 된다.
 해당 순열의 마지막은 전체의 내림차순은 6 5 4 3 2 1이다.
 */
