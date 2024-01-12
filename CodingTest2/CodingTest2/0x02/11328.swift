//
//  11328.swift
//  CodingTest2
//
//  Created by SeokHyun on 1/10/24.
//

let n = Int(readLine()!)!

func isAnswer(_ firstChecked: [Int], _ secondChecked: [Int]) -> String {
  for i in 0..<26 {
    if firstChecked[i] != secondChecked[i] {
      return "Impossible"
    }
  }
  return "Possible"
}

for _ in 0..<n {
  let inputs = readLine()!.split { $0 == " " }.map { String($0) }
  let firstArr = inputs[0].map { String($0) }
  let secondArr = inputs[1].map { String($0) }
  var firstChecked = Array(repeating: 0, count: 26)
  var secondChecked = Array(repeating: 0, count: 26)
  
  for firstChar in firstArr {
    firstChecked[Int(UnicodeScalar(firstChar)!.value)-97] += 1
  }
  
  for secondChar in secondArr {
    secondChecked[Int(UnicodeScalar(secondChar)!.value)-97] += 1
  }
  
  print(isAnswer(firstChecked, secondChecked))
}

/*
 같은 문자가 여러번 나올 경우가 있기 때문에, 같은 알파벳의 개수를 비교하면 된다.
 */
