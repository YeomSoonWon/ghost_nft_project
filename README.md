# Problem<br>
<!-- Line -->
ghost pfp를 보유했을 때 얻을 수 있는 직접적인 인센티브와 아티스트들이 참여할 체계적인 시스템이 없다.<br>

# Solution
<!-- Line -->
> ![20220310191444](https://user-images.githubusercontent.com/96465753/157643644-0ca24011-4420-4cf1-99fb-95c952e48e1a.png)
nft 거래에서 발생하는 수수료는 거래소와 아티스트가 가져가는 경우가 많다.
이런 구조를 조금만 바꿔본다면 pfp의 유틸리티를 잡으면서 아티스트들이 pfp 보유하도록 하는 인센티브를 제공할 수 있다.
아티스트가 자신의 작품을 Ghost_Community_Art NFT에서 민팅하기 위해서는 ghost pfp를 보유하고 있어야 한다. 자신이 보유한 pfp 중 한 가지를 선택해 nft 민팅에 사용한다. 여기서 사용한다는 의미는 이더리움의 스토리지에 해당 ghost pfp 번호와 Ghost_Community_Art 번호를 mapping한다는 의미이다. 각 ghost pfp는 레어리티를 기준으로 Ghost_Community_Art에서의 민팅 횟수가 정해져있다. 민팅한 Ghost_Community_Art nft를 시장에서 판매하면 민팅 당시 사용한 ghost nft 보유자에게 수수료가 지급된다.
<br>
예상 효과 : 활발하게 거래되는 Ghost_Community_Art와 mapping된 ghost은 수수료를 받을 수도 있고 그것을 기준으로 더 높은 가격에 판매할 수도 있다.
이 경우 아티스트가 직접 보유할 가능성이 높다.
ghost pfp 별로 Ghost_Community_Art에서의 민팅 횟수가 다르기 때문에 ghost pfp 별로 차별화할 수도 있다. 민팅 횟수가 더 많은 남은 pfp는 더 비싸게 팔릴 수도 있다.<br>

# Development Stack<br>
<!-- Line -->
![20220304083500](https://user-images.githubusercontent.com/96465753/156671381-2f12a244-97f5-4bc8-ab0f-57624c256b87.png)<br>

# Todo List
1. Depoly smart contract
- [] ghost_project contract 커스터마이즈 후 배포
- [] ghost_community_art contract 작성 및 배포

2. Frontend development
- [] ghost_community_art 웹페이지 제작
