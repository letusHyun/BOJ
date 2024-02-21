//
//  1920_1.swift
//  수 찾기
//
//  Created by SeokHyun on 2/21/24.
//

let n = Int(readLine()!)!
let arrN = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by:<) // NlogN
let m = Int(readLine()!)!
let arrM = readLine()!.split{$0==" "}.map{Int(String($0))!}
var result = ""

// MlogN
for elem in arrM {
  if binarySearchFor(elem) {
    result += "1\n"
  } else {
    result += "0\n"
  }
}
print(result)

// 반복문 이용
func binarySearchFor(_ target: Int) -> Bool {
  var l = 0
  var r = arrN.count-1
  while (l <= r) {
    var m = (l+r)/2
    if arrN[m] > target {
      r = m-1
    } else if arrN[m] < target {
      l = m+1
    } else {
      return true
    }
  }
  return false
}
// MARK: - Note
/*
 - 2중for문을 사용한다면, O(N*M)으로 시간초과
 - O(NlogN + MlogN)
 */

