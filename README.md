# tiny-enchanter

## 1️⃣ 프로젝트 정보
- 팀 명: nini
- 서비스 이름: 꼬마 마법사 (tiny-enchanter)
- 이름의 의미: "Tiny Enchanter"는 '작은 마법사' 또는 '매혹적인 작은 것을 만드는 사람'이라는 의미를 가질 수 있습니다. 
             이는 SD 케릭터를 만드는 저희 서비스에 대한 독특하고 매력적인 이름입니다.
<br></br>
## 2️⃣ 프로젝트 개요
- Tiny Enchanter는 창작의 장벽을 낮추어 모든 사람들이 쉽게 자신의 창의력을 발휘할 수 있게 하는 것입니다.
- 우리는 사용자가 시간이나 비용의 부담 없이, 그리고 복잡한 학습 과정 없이도 자신만의 SD(Super Deformed) 캐릭터를 만들 수 있는 환경을 제공합니다.
<br></br>
## 3️⃣ 기능
- 사용자 옵션 선택: `choice.html`을 통해 다양한 옵션을 제공하고 사용자 선택을 받습니다. 
- 결과 표시: 사용자의 선택에 기반하여 결과를 `result.html` 페이지에서 보여줍니다.
- 오류 처리: 잘못된 요청이나 오류를 `wrong.html` 페이지를 통해 사용자에게 알립니다.
- 데이터베이스 관리: MySQL을 사용하여 사용자 데이터와 시스템 데이터를 관리합니다.
<br></br>
## 4️⃣ 설치 방법
- 소스 코드 복제: `git clone https://github.com/ing970/tiny-enchanter.git`
- 필요한 라이브러리 설치: `pip install -r requirements.txt`
- 서버 실행: `python tiny_enchanter.py`
<br></br>
## 5️⃣ 사용 방법
- 웹 브라우저에서 index.html을 열어 프로젝트의 홈페이지에 접속합니다.
- 각 페이지의 지시에 따라 옵션을 선택하고 결과를 확인합니다.
- 데이터베이스 관련 작업은 connection.py 스크립트를 통해 관리합니다.
<br></br>
## 6️⃣ 프로젝트 구조 및 파일 설명
### 📍 웹 인터페이스 파일
- `index.html`: 프로젝트의 메인 페이지. 사용자에게 첫 인상을 제공합니다.
- `aboutus.html`: 프로젝트 팀과 목표에 대한 정보를 제공합니다.
- `choice.html`: 사용자가 옵션을 선택할 수 있는 인터페이스를 제공합니다.
- `result.html`: 사용자의 선택에 따른 결과를 보여주는 페이지입니다.
- `wrong.html`: 잘못된 요청이나 오류를 사용자에게 알리는 페이지입니다.

### 📍 스타일링 파일
- `choice.css`, `result.css`, `aboutus.css`: 각 HTML 파일에 대한 스타일 정의를 포함합니다.

### 📍 백엔드 및 데이터 처리
- `connection.py`: 서버 및 데이터 처리 로직을 담당합니다.
- `tiny_enchanter.py`: 프로젝트의 핵심 알고리즘과 기능을 구현합니다.
  
### 📍 데이터베이스 설계 파일
- `NINI_category.sql`, `NINI_client_order.sql` 등: 데이터베이스 구조 및 쿼리 정의를 포함합니다.
<br></br>
## 7️⃣ 사용된 기술 및 프레임워크
이 프로젝트는 HTML, CSS, JavaScript, Python(FastAPI), 그리고 MySQL을 사용합니다. 각 기술은 프로젝트의 다양한 측면을 담당합니다.

- HTML/CSS: 사용자 인터페이스의 구조와 디자인을 담당합니다.
- JavaScript: 인터랙티브한 웹 경험을 제공합니다.
- Python(FastAPI): 서버 사이드 로직과 데이터 처리를 관리합니다.
- MySQL: 데이터 저장 및 관리를 위한 데이터베이스 시스템입니다.
<br></br>
## 8️⃣ 데이터베이스 설계 및 ERD
프로젝트의 데이터베이스 설계는 아래 ERD를 참조하십시오. ERD는 프로젝트의 데이터 구조를 시각적으로 표현하고, 각 테이블과 그 관계를 설명합니다.

### 📍 ERD 다이어그램

<img src="https://github.com/ing970/tiny-enchanter/assets/120775224/05d6262e-d6c0-4dec-aafa-18dff47751bb" width="470">

- 이 ERD는 테이블 간의 관계를 명확하게 보여주며, 데이터베이스의 설계와 흐름을 이해하는 데 도움을 줍니다.
- 각 테이블은 서로 연결되어 사용자의 경험과 데이터 흐름을 지원합니다.

### 📍 ERD 설계 상세
- category 테이블
  - 서비스에서 사용되는 다양한 카테고리를 분류합니다. 각 카테고리는 고유한 `Category_id`를 가지며, 카테고리의 이름을 `Category_name` 필드에 저장합니다.
- checkbox 테이블
  - 사용자에게 표시되는 체크박스 항목을 관리합니다. 각 체크박스는 고유한 `Checkbox_id`를 가지고, 해당하는 `Category_id`를 외래 키로 사용하여 category 테이블에 연결됩니다. 체크박스는 선택될 때와 선택되지 않을 때 표시되는 프롬프트인 `Checkbox_p_prompt`와 `Checkbox_n_prompt`를 가집니다.
- checkpoint_model 테이블
  - 사용자의 진행 상태나 특정 지점을 모델링하는 체크포인트를 관리합니다. `Cp_model_id`는 각 체크포인트 모델의 고유 식별자이며, `Cp_model_name` 필드에 모델의 이름이 저장됩니다.
- client_order 테이블
  - 사용자의 주문을 관리합니다. 각 주문은 `Serial_id`로 구분되며, `Serial_type`은 주문 유형을 나타냅니다. 주문은 `Checkbox_id`를 통해 사용자가 선택한 체크박스 옵션과 연결됩니다.
- result 테이블
  - 생성된 결과의 정보를 저장합니다. No는 결과의 고유 식별자이며, Image 필드는 생성된 이미지의 경로를 저장합니다. `Created_at`은 결과가 생성된 시간을 기록합니다.
