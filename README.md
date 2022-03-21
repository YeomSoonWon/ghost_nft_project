# 규칙
1.고스트 홀더만 민팅할 수 있음.<br>
2.ai 필터를 거친 랜덤 고스트가 민팅된다.<br>

지갑을 연결했을 때 화이트리스트(특정 시점의 고스트 소유자)가 아니라면 민팅 불가하다는 문구가 나온다.
화이트리스트일 경우 민팅 버튼이 나온다.(이 부분 재밌게 구현하기.)
보유자의 고스트 기반 아트를 민팅할 수 있다.
고스트가 여러개 일경우 하나를 선택하도록 한다. 혹은 첫번째 고스트를 디폴트값으로 해 선택사항이 없도록 한다.

# Development Stack<br>
<!-- Line -->
![20220304083500](https://user-images.githubusercontent.com/96465753/156671381-2f12a244-97f5-4bc8-ab0f-57624c256b87.png)<br>
https://docs.alchemy.com/alchemy/tutorials/nft-minter

# Todo List
1. Depoly smart contract
- Dapp 설계[x] (~3/25)
- smart_contract 구현[x]
- smart_contract 테스트[x]
- smart_contract 리뷰[x]

2. Frontend development
- 페이지 설계[x]
- 페이지 개발[x]
- smart_contract 연동 테스트[x]