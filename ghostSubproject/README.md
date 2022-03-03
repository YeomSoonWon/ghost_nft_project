### ghost sub project stack<br>
solidity - hardhat, openzeppelin<br>
interacting with the Ethereum by web3.js or ethers.js<br>
security - env, dotenv <br>
frontend - react.js<br>

### ghost community minting protocol<br>
## -목적 : 고스트의 유틸리티를 증가시켜 pfp의 가치를 올리고 아티스트의 활동을 촉진시킨다.<br>
1. 고스트 홀더만 참여 가능. 각 nft 별로 민팅횟수 최대 n번으로 제한 (고스트 순위별로 민팅 횟수 차별화)<br>
a.커뮤니티의 투표를 통해 승인 받은 작가 주소를 화이트리스트에 추가해 해당 주소만 발행할 수 있도록 한다.<br>
2. nft는 ghost_community_arts 컨트랙트로 발행됨.(하나의 컬렉션을 묶임.)<br>
a.원작자 표시를 위해 메타 데이터에 발행한 주소 기록.<br>
b.어떤 고스트의 민팅 횟수를 사용했는지 표기한다.(수수료는 해당 pfp 보유자에게 돌아간다.)<br>
3. 입찰 방식.<br>
고스트 홀더만 참여할 수 있는 기회가 주어지고 아티스트는 해당 nft의 최소 입찰 금액을 입력한다.<br>
최소 입찰 금액이상의 입찰이 없을 시 nft 발행은 중단된다.<br>
최소 입찰액 이상이 되면 nft가 발행되고 입찰자에게 transfer된다.<br>
수수료 구조 : 아티스트가 art 발행당시 사용한 pfp 보유자에게 수수료 3% 제공. 고스트 팀 수수료 1%, 팀수익 1%, 오픈씨 2.5%<br>