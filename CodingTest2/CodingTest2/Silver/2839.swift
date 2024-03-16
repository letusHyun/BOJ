//
//  2839.swift
//  설탕 배달
//
//  Created by SeokHyun on 3/16/24.
//

var kg = Int(readLine()!)!
var count = 0

while kg >= 0 {
  if kg % 5 == 0 { // a.
    while kg != 0 {
      kg -= 5
      count += 1
    }
    break
  }
  
  // b.
  kg -= 3
  count += 1
}

if kg == 0 {
  print(count)
} else {
  print(-1)
}

// MARK: - Note
/*
 설탕: 3kg, 5kg
 1. 5kg의 봉지만 사용하는 방법
 2. 5kg, 3kg 봉지를 사용하는 방법
 3. 3kg의 봉지를 사용하는 방법
 4. 두 봉지를 사용하지 못하는 경우
 
 이렇게 정답이 도출되는 경우는 4가지가 있다.
 
 a. 처음에 5kg로 나누어 떨어지는지 확인을 하고, 나누어진다면 counting을 하고 종료시킨다.
 b. a.의 if문 밑으로 내려온 경우라면, 현재 5kg를 사용할 수 없는 상태이다. 이때는 3kg를 사용해서 counting을 해준다.
 이를 반복하다가 kg가 음수가 된다면 반복을 종료한다.
 
 outer while문이 종료된 경우는 2가지이다.
 1. kg가 0이어서 종료된 경우
 이 경우는 5kg의 봉지만을 사용했거나, 5kg와 3kg 봉지를 사용해서 counting에 성공한 경우이다.
 
 2. -3kg 연산을 통해 kg가 음수가 되어서 종료된 경우
 이 경우는 5kg봉지와 3kg봉지를 이용해도 결과를 도출할 수 없음을 의미한다. 따라서 예외처리인 -1을 출력한다.
 */
