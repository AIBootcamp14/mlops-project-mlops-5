# **MLOps Project - Movie Prediction (Team 5, 3X+Y)**

- **프로젝트 기간:** 2025.07.28 ~ 2025.08.08

- **GitHub:** [3X+Y MLOps Project Team Repository](https://github.com/AIBootcamp14/mlops-project-mlops-5)

- **React 배포 결과:**

https://github.com/user-attachments/assets/df210b4e-fe9b-4954-95fc-d42d0cbe26b0
> 링크(현재는 만료됨): http://15.164.236.229:3000/

---

## **1. 서비스 구성 요소**

### **1.1 주요 기능**

- **영화 데이터 수집/가공/적재:** TMDB 인기 영화 API 활용, 가상 유저 시청/평점 로그 생성, PostgreSQL 및 S3 백업
- **모델 학습/추론/실험 관리:** 경량 MLP 모델로 영화 추천, MLflow로 실험/아티팩트 관리, 결과 S3/DB 저장
- **API 서빙/자동화:** FastAPI로 모델 예측 결과 API 제공, Airflow DAG 기반 전체 파이프라인 자동화
- **모니터링/로깅:** Prometheus, Grafana, Loki 활용, 각 서버/컨테이너 상태 및 로그 실시간 모니터링, Alert 규칙 적용

### **1.2 사용자 흐름**

1. 유저가 영화 추천 사이트(React UI) 입장 
2. 유저가 추천 요청 → FastAPI 엔드포인트로 API 호출
3. 서버에서 최신 추천 결과 반환, React UI에서 확인
4. 백엔드 자동화 파이프라인(Airflow)로 데이터→학습→배포→모니터링까지 일괄 관리

---

## **2. 활용 장비 및 협업 툴**

### **2.1 활용 장비**

- **서버:** AWS EC2 3대 (Ubuntu 24.04)
    - 서버1(mlops-workhorse): 데이터/모델링/서빙
    - 서버2(mlops-controltower): 자동화 파이프라인
    - 서버3(mlops-nervous): 모니터링/로깅
- **개발환경:** 도커, pyenv, Git, UFW, SSH Key 등
- **테스트 장비:** 각 팀원 노트북 (Windows/Mac/Linux)

### **2.2 협업 툴**

- **소스/버전 관리:** GitHub
- **프로젝트 관리:**
    - Github Projects
        
        <img width="1776" height="1041" alt="1" src="https://github.com/user-attachments/assets/9517caaa-724e-4eb5-b57f-9f5a5aa3d069" />

        
    - Github Issues (82)
        
        <img width="910" height="1166" alt="2" src="https://github.com/user-attachments/assets/083d95fd-dd6b-4056-b003-d501db648488" />

        
    - 대규모 이슈 → 세부 서브이슈 분할
        
        <img width="987" height="776" alt="3" src="https://github.com/user-attachments/assets/5b555c0e-90f5-4449-a852-f7f9183ffa1b" />

        
    - **커뮤니케이션:** Slack, Zoom
    
        <img width="2010" height="1081" alt="4" src="https://github.com/user-attachments/assets/95fa5014-a5e1-4299-bf0f-5f7f055ee95e" />

    

---

## **3. 최종 선정 AI 모델 구조**

- **모델명:**
    - Multi-Layer Perceptron (MLP, Numpy 기반)
- **구조 및 특징:**
    - 입력(rating, popularity, watch_seconds)
    - 2개의 Hidden Layer (ReLU, BatchNorm)
    - Softmax 출력
    - Cross-Entropy Loss 기반 다중분류
- **학습 데이터:**
    - TMDB API 수집(영화 200개+가상유저 300명, 약 2900개 시청 로그)
- **평가 지표:**
    - Accuracy
    - Cross-Entropy Loss


---

## **4. 서비스 아키텍처**

### **4.1 시스템 구조도**

<img width="1920" height="1080" alt="5" src="https://github.com/user-attachments/assets/2b741341-a91e-4519-abf5-8351f71f4648" />


### **4.2 데이터 흐름도**

1. TMDB API → Raw 데이터 PostgreSQL 적재/S3 백업
2. 데이터 전처리/가상 유저 생성
3. 모델 학습 및 실험 (MLflow)
4. 예측 결과 API화(FastAPI), 프론트엔드(React) 연동
5. 전체 파이프라인 Airflow DAG로 자동화, 백업/로깅/모니터링 서버3에서 실시간 감시

---

## **5. 사용 기술 스택**

<img width="1920" height="1080" alt="6" src="https://github.com/user-attachments/assets/bf1fd053-7bd7-4dca-8406-0d4b83ddfae9" />



### **5.1 백엔드**

- FastAPI, Airflow, MLflow, PostgreSQL, S3

### **5.2 프론트엔드**

- React.js (최신 추천 결과 UI)

### **5.3 머신러닝 및 데이터 분석**

- Numpy, Pandas, scikit-learn, MLflow

### **5.4 배포 및 운영**

- Docker, Docker Compose, AWS EC2, S3
- Prometheus, Grafana, Loki, UFW, SSH

---

## **6. 팀원 소개**

| 이름 | 역할 | GitHub | 담당 기능 요약 |
| --- | --- | --- | --- |
| **김선민** | 데이터 수집/적재 | https://github.com/nimnusmik | 팀 일정 관리, TMDB 데이터 크롤링, 가상유저 로그 생성, DB/S3 적재, 데이터 표준 스키마 설계, 데이터 전처리(피처 선택), SQL RDBMS |
| **김장원** | 모델링/추론/배포 | https://github.com/jkim1209 | 데이터 분석, 경량 MLP 모델 구현, MLflow 실험, FastAPI/React App, 추론/배포 전체, 서비스별 도커 이미지 버전 관리 |
| **장윤정** | 모니터링/로깅 | https://github.com/yjjang06 | Prometheus/Grafana/Loki 환경 구축, 메트릭/로그 대시보드, Alert 규칙, 서버별 클라이언트/관리자 인프라 구현 |
| **최현화** | 인프라/통합/운영 | https://github.com/iejob | 공통 인프라/보안(Docker, pyenv, UFW, SSH 등), 서버별 툴 설치, 개발환경 표준화, FastAPI/Airflow Dag 자동화 파이프라인, 서버 1,2 연동, 모니터링 클라이언트 적용, GitHub 팀레포 브랜치 관리자 |

---

## **7. Appendix**

### **7.1 프로젝트 구조**

```bash
mlops-project-mlops-5/
├── dags/                            # [Airflow DAG 자동화 (오케스트레이션 서버, Airflow)]
│
├── data/                            # [데이터 파일 저장 (공통 마운트, 모든 서버에서 접근)]
│   ├── raw/                         # [원본 데이터 (데이터 수집 서버, 크롤러 컨테이너)]
│   └── processed/                   # [전처리/피처 데이터 (피처엔지니어링 서버, S3)]
│
├── docs/                            # [공식 문서 (팀 전체, PRD/설계/명세/가이드)]
│
├── frontend/                        # [프론트엔드 폴더 (React)]
│
├── logs/                            # [운영/실행/모니터링 로그 (각 서버/컨테이너 생성)]
│   ├── airflow/                     # [Airflow 실힘 로그(자동화 파이프라인 서버)]
│   ├── docker-services/             # [서버1, 서버2 실행된 각 도커 서비스 로그]
│   ├── mlflow/                      # [MLflow 실험 로그 (ML 실험/모델링 서버)]
│   └── scripts/                     # [스크립트 실행 로그 (전체 파이프라인)]
│
├── models/                          # [학습된 모델/체크포인트 (모델링 서버, MLflow/서빙 컨테이너)]
│   └── checkpoints/                 # [중간 저장, 에폭별 체크포인트]
│
├── scripts/                         # [파이프라인 실행/로직 (각 서버/컨테이너별 사용)]
│   ├── data_prepare/                # [데이터 전처리 및 준비 코드]
│   ├── dataset/                     # [데이터셋 관련 코드 및 관리]
│   ├── evaluate/                    # [모델 평가 관련 코드]
│   ├── inference/                   # [모델 추론 코드]
│   ├── log/                         # [스크립트 실행 시 생성되는 로그 관리]
│   ├── model/                       # [모델 정의 및 저장 관련 코드]
│   ├── monitoring/                  # [서버/모델 모니터링 관련 코드]
│   ├── postprocess/                 # [후처리 작업 코드]
│   ├── train/                       # [모델 학습 코드]
│   └── utils/                       # [공통 유틸리티 함수/모듈]
│
├── services/                        # [컨테이너 서비스/도커/컴포즈 (각 서버/파트 담당)]
│   ├── api/                         # [API 서버 관련 서비스]
│   ├── frontend/                    # [프론트엔드 서비스 (React 등)]
│   ├── model_inference/             # [모델 서빙/추론 서비스]
│   └── monitoring/                  # [모니터링 및 운영 상태 관리 서비스]
│
├── .paths/                          # [경로(alias) 관리 전용 디렉토리 (공통, 모든 서버)]
│   └── paths.env                    # [alias 환경변수 파일 예시, 예: DATA_RAW=~/mlops-project/data/raw]
│
├── .env                             # [환경 변수 파일 (공통, 모든 서버)]
├── .gitignore                       # [Git 추적 제외 목록 (공통)]
├── docker-compose.yml               # [전체 서비스/컨테이너 오케스트레이션]
├── README.md                        # [프로젝트 설명/가이드]
└── requirements.txt                 # [파이썬 의존성 명세 (공통)]

```

### **7.2설치 및 실행 방법 (간략화)**

1. **필수 라이브러리 설치:**
    
    ```bash
    # 패키지 목록 업데이트
    sudo apt update && sudo apt upgrade -y
    
    # Docker 및 Docker Compose + 필수 설치
    sudo apt install -y curl wget git zip unzip htop vim tmux tree \
      python3 python3-pip docker.io docker-compose \
      ca-certificates software-properties-common build-essential net-tools
    
    # 현재 사용자에게 Docker 그룹 권한 추가 (로그아웃 후 다시 로그인해야 적용)
    sudo usermod -aG docker $US
    
    # Docker 서비스 시작 및 부팅 시 자동 실행 설정
    sudo systemctl start docker
    sudo systemctl enable docker
    ```
    
2. **Docker Compose 실행 (각 서버별)**
    - 서버 1
        
        ```bash
        source .env
        source .paths/paths.env
        source frontend/.env
        scripts/utils/create_env_js.sh
        docker compose build --no-cache && docker compose up -d
        bash ./scripts/monitoring/client/setup.sh
        ```
        
    - 서버 2
        
        ```bash
        source .env
        source .paths/paths.env
        docker compose build --no-cache && docker compose up -d
        bash ./scripts/monitoring/client/setup.sh
        ```
        
    - 서버 3
        
        ```bash
        source .env
        source .paths/paths.env
        bash ./scripts/monitoring/infra/setup.sh
        ```
        
3. **웹페이지 접속:**
    - 서버1: 사용자 페이지
        - 사용자 영화 추천 페이지: http://<서버1 IP>:3000/
        - FastAPI: http://<서버1 IP>:3000/
    - 서버2: Airflow Dag 파이프라인 자동화 실행
        - Airflow: http://<서버2 IP>:8080/
    - 서버3 : 모니터링
        - Grafana: http://<서버3 IP>:3000

### **7.3 실행 결과**

- 데이터 수집, 전처리 및 저장
    - 전처리 데이터 저장
        
        ⚬로컬 저장: 로그 및 디버깅용
        
        ⚬PostgreSQL DB 저장: 학습 및 API 연동을 위한 정형 데이터베이스로 활용
        
        ⚬S3 업로드: 장기 보관 및 백업 용도
        
    
    <img width="1401" height="501" alt="7" src="https://github.com/user-attachments/assets/deb08dc1-135d-4f45-928c-03cf8cdce154" />

    
    <img width="1335" height="675" alt="8" src="https://github.com/user-attachments/assets/e311380c-5ecd-4c30-a817-af1c00f0abe9" />

    
- 모델 학습 및 추론 결과 저장
    
    <img width="879" height="648" alt="9" src="https://github.com/user-attachments/assets/718ef19e-63bb-4203-a591-6419ecaf3314" />

    
- 모델 학습 및 추론 결과 저장
    
    <img width="1110" height="473" alt="10" src="https://github.com/user-attachments/assets/54c3441a-6283-4829-bac3-7246da2b5049" />

    
    <img width="1110" height="787" alt="11" src="https://github.com/user-attachments/assets/42bf0c94-81ef-4e00-97cd-1091b5ea9387" />

    
    <img width="1273" height="621" alt="12" src="https://github.com/user-attachments/assets/3e587291-ca2c-4f4e-bce7-ef2420b69e44" />

    
- 모델 학습 및 추론 결과 저장
    
    <img width="895" height="766" alt="13" src="https://github.com/user-attachments/assets/a8393f2e-65dd-4e25-99f0-584cbeee0e5b" />

    
    <img width="1497" height="756" alt="14" src="https://github.com/user-attachments/assets/3482b46d-9188-49f7-9cf5-557d8cc9cfd7" />

    
    - 모델 배포
        - 학습된 추천 모델을 API로 서빙하고, 프론트엔드에서 추천 결과를 실시간으로 시각화
            
            ⚬ FastAPI 서버: 가벼우면서도 비동기 처리가 가능해 실시간 API 서버로 적합
            
            ⚬ React 프론트엔드: 사용자 인터랙션 처리 및 컴포넌트 기반 UI 구성에 유리
            
        - 주요 FastAPI 엔드포인트
    
    | Method | Endpoint | 설명 |
    | --- | --- | --- |
    | GET | /available-content-ids | 추천 가능한(학습된) 콘텐츠 ID 목록 조회 |
    | GET | /available-contents | 추천 가능한(학습된) 콘텐츠 ID, 제목, 포스터 조회 |
    | GET | /latest-recommendations?k=10 | 가장 최근 추천 결과 k개 조회 (기본 10개, 중복은 제거됨) <br> > React 프론트엔드에 표시되는 값 <br> > 콘텐츠 ID, 제목, 포스터, 줄거리 조회 |
    | POST | /predict | 단일 사용자 입력에 대한 콘텐츠 추천 <br> > latest-recommendations 값에 업데이트되어 React 프론트엔드에서 새롭게 업데이트 |

- 모델 배포
    - 학습된 추천 모델을 API로 서빙하고, 프론트엔드에서 추천 결과를 실시간으로 시각화
        
        ⚬ FastAPI 서버: 가벼우면서도 비동기 처리가 가능해 실시간 API 서버로 적합
        
        ⚬ React 프론트엔드: 사용자 인터랙션 처리 및 컴포넌트 기반 UI 구성에 유리
        
    - 주요 FastAPI 엔드포인트
    
    | Method | Endpoint | 설명 |
    | --- | --- | --- |
    | GET | /available-content-ids | 추천 가능한(학습된) 콘텐츠 ID 목록 조회 |
    | GET | /available-contents | 추천 가능한(학습된) 콘텐츠 ID, 제목, 포스터 조회 |
    | GET | /latest-recommendations?k=10 | 가장 최근 추천 결과 k개 조회 (기본 10개, 중복은 제거됨)
    > React 프론트엔드에 표시되는 값
    > 콘텐츠 ID, 제목, 포스터, 줄거리 조회 |
    | POST | /predict | 단일 사용자 입력에 대한 콘텐츠 추천
    > latest-recommendations 값에 업데이트되어 React 프론트엔드에서 새롭게 업데이트 |
- FastAPI & React
• http://15.164.236.229:8000/docs
    
    <img width="1093" height="834" alt="15" src="https://github.com/user-attachments/assets/43f1b77e-5000-4682-ac95-1213c8fb5cd8" />

    
    - React App 시연
    
    https://github.com/user-attachments/assets/df210b4e-fe9b-4954-95fc-d42d0cbe26b0
    
    - 입력된 콘텐츠 특징을 바탕으로 유사한 콘텐츠를 예측하는 콘텐츠 기반 추천 시스템
        
        ⚬ 입력된 content_id, watch_seconds, rating, popularity 기반으로 API 서버에 탑재된 MLP 모델이 실시간 추론을 수행하고 사용자에게 유사 콘텐츠의 영화를 DB에서 조회하여 새롭게 추천
        
        ⚬ 이때 입력된 content_id는 기존에 학습된 콘텐츠 중 하나
        
        <img width="841" height="821" alt="16" src="https://github.com/user-attachments/assets/abb03f31-5f1a-40d0-86d5-a7d40965dda0" />

        
        <img width="1864" height="932" alt="17" src="https://github.com/user-attachments/assets/4bd6d1fc-e929-4309-b75b-5f0ef65704e9" />

        
    - 입력된 콘텐츠 특징을 바탕으로 유사한 콘텐츠를 예측하는 콘텐츠 기반 추천 시스템
        
        ⚬ 입력된 content_id, watch_seconds, rating, popularity 기반으로 API 서버에 탑재된 MLP 모델이 실시간 추론을 수행하고 사용자에게 유사 콘텐츠의 영화를 DB에서 조회하여 새롭게 추천
        
        ⚬ 이때 입력된 content_id는 기존에 학습된 콘텐츠 중 하나
        
        <img width="683" height="247" alt="18" src="https://github.com/user-attachments/assets/7ad3b29c-e074-4726-b06c-fcad16447fd9" />

        
- Airflow 자동화 파이프라인
    - 목적:
        
        ⚬ 데이터 수집, 모델 학습, 추론 등 전체 ML 파이프라인을 Airflow 기반 자동화 파이프라인으로 운영
        
    - 구성:
        
        ⚬ Airflow가 정해진 주기(예: 하루 1번 00:00시) 마다 서버1 (FastAPI)의 각 단계별 엔드포인트를 자동 호출
        
    - 주요 장점:
        
        ⚬ 반복/수동작업 최소화
        
        ⚬ 신속한 파이프라인 재실행
        
        ⚬ 장애 시 자동 재시도
        
    - Airflow DAG 흐름 및 핵심 로직
        
        <img width="1093" height="834" alt="19" src="https://github.com/user-attachments/assets/ab2964da-8124-4127-801a-23f598f9db34" />

        
        <img width="1264" height="345" alt="20" src="https://github.com/user-attachments/assets/fc1a1417-f266-4fa0-815a-56c5f4cf30c1" />

        
        1. API 서버 상태 확인
        
        ⚬ PythonSensor로 FastAPI /health 엔드포인트 상태 확인
        
        2. 데이터 준비
        
        ⚬ run_prepare_data_task: 데이터 수집/전처리
        
        - 3. 모델 학습
            
            ⚬ run_train_task: 모델 학습
            
        
        4. 배치 추론
        
        ⚬ run_batch_inference_task: 모델 론/예측
        
        5. 태스크 간 의존성
        
        ⚬ 상태 체크 → 데이터 준비 → 모델 학습 → 배치 추론 순서로 동작
        
        - 코드 주요점
            
            ⚬ 각 태스크에서 실패 시 최대 5회 재시도
            
            ⚬ 태스크별 타임아웃/오류 관리
            
    - API 호출 로직 및 에러 처리
        - 공통 함수화
            
            ⚬ 모든 API 호출 로직(run_pipeline_task)을 별도 파일
            
        - 에러 처리/검증
            
            ⚬ 요청 실패, 결과 불일치, HTTP 오류 등 상황별로 AirflowException 발생시켜 자동 재시도
            
            ⚬ /health API로 서버 상태 주기적 체크
            
        - 유지보수성
            
            ⚬ 엔드포인트/페이로드/기대 결과만 변경해도 손쉽게 재사용 가능
            
    - 장애 상황 처리 예시
        - Server1의 FastAPI 서빙(my-mlops-api)이 미실행 또는 이상 상태일 경우, Airflow DAG의 check_api_health에서 오류 감지 후 파이프라인 중단
        - 각 태스크는 실패 시 최대 5회 재시도 수행
        - my-mlops-api 복구 시 check_api_health 통과 후 전체 파이프라인 정상 실행(초록색 표시)
        - 아래 이미지는 서비스 장애 시와 복구 후 상태 변화를 시각적으로 표현
            
            <img width="1319" height="339" alt="21" src="https://github.com/user-attachments/assets/0d2b622f-025b-46a8-9ea2-d7a2ba309753" />

            
    - Airflow도커 환경에서의 Airflow 자동화(운영환경) Dag 실행 결과
        - 배포 자동화
            - docker-compose.yaml, Dockerfile로 Airflow 환경 손쉽게 배포
            - 서버2에서 컨테이너 기반으로 신속/일관성 있게 실행
        - 운영 관리
            - 환경변수(예: SERVER_1_IP)로 유연한 서버 연결
            - 장애 시 컨테이너 재기동으로 복구 용이
- Monitoring(Client/Admin)
    - Prometheus
        - 서버의 CPU 사용률, 메모리 사용량, 네트워크 트래픽 등 다양한 성능 지표(Metrics)를 수집하고 저장
        - Alert manager를 사용하여 Slack, 이메일 등으로 알림을 보낼 수 있도록 alert-rules 기반으로 경고를 생성
        - 시계열 데이터베이스 기반으로 지표를 저장하여 과거 데이터와 비교 및 분석이 용이
        
        <img width="934" height="806" alt="22" src="https://github.com/user-attachments/assets/22bcb82e-5f38-4295-8149-c106058080bb" />

        
    - Grafana
        - 다양한 소스에서 수집된 데이터를 통합하고, 대시보드를 통해 시각화
        - Prometheus, Loki 등으로 수집한 데이터를 통해 그래프, 차트, 테이블 등의 형태로 보여주도록 구성
        
        <img width="1751" height="734" alt="23" src="https://github.com/user-attachments/assets/4bb54b72-8090-4e08-9ef1-96910073e4ae" />

        
        <img width="1607" height="901" alt="24" src="https://github.com/user-attachments/assets/8920e05c-1cee-454f-9f56-31dc8757958c" />

        
    - Alertmanager
        - Prometheus가 보낸 경고를 효율적으로 관리하고 사용자에게 전달
            
            <img width="645" height="806" alt="25" src="https://github.com/user-attachments/assets/29fa7ab8-9c00-473e-838e-09414a473954" />

            
            - Slack 메세지 오류 메세지 전달
                
                <img width="1091" height="806" alt="26" src="https://github.com/user-attachments/assets/681ce0d2-f234-44f1-a719-7555e06b9db8" />

                
    - Loki
        - 로그 데이터를 수집하고 저장, 검색
        - 레이블 기반으로 효율적인 검색 기능을 지원
        
        <img width="935" height="648" alt="27" src="https://github.com/user-attachments/assets/575d139a-f6a1-450c-9d8f-35057f160d43" />

        
        <img width="2850" height="1620" alt="28" src="https://github.com/user-attachments/assets/8e5351f6-b936-4799-b51e-91d7a90bc37f" />

        
    - Node-Exporter
        - 서버의 하드웨어 및 OS 지표를 수집하여 Prometheus가 스크랩할 수 있는 형태로 변환
    - Promtail
        - 텍스트 기반 로그를 통해 수집가능한 지표를 생성
        - 로그파일이 위치한 경로를 설정하면 해당 경로 내 로그 파일을 읽어서 Loki로 전송

### 7.4 최종 결과

- React App 시연

    ![react_main](https://github.com/user-attachments/assets/0341d28b-9d99-48b4-9c72-0cb27e38771f)

### **8. 한계 및 회고**

- Feast Feature Store, CI/CD(GitHub Actions)는 시간/환경 문제로 미구현
- 서버3(모니터링)는 Prometheus, Grafana, Loki만 적용, 로그 메트릭화 및 Alert는 성공
- 전체 서비스는 Docker Compose로 서버별 4개 컨테이너씩 환경변수 기반 통합 실행
- 데이터 백업 및 모델 아카이빙은 S3에 병렬로 저장
- 팀원별 역할 분담 및 병렬 개발/통합 경험, 실제 실무 DevOps·MLOps 핵심 역량 강화
    - **김선민**: 깃 협업과 개발 경험이 부족한 상태에서 LLM에 의지해 새로운 기술을 적용하는 것은 마치 한쪽 다리를 잃은 채 걷는 것과 같았다. LLM과 새로운 툴은 매력적이지만, 도입 전 현실적인 검토의 중요성을 깨달았고, 트러블슈팅과 협업 과정에서 많은 것을 배운 소중한 프로젝트였다.
    - **김장원**: 처음엔 기능을 연결하는 것조차 조심스러웠지만, 데이터 수집부터 모델 서빙까지 전 과정을 직접 설계·구현하며 MLOps라는 퍼즐을 맞춰볼 수 있었다. 도커, FastAPI, S3, PostgreSQL 같은 도구들이 처음엔 낯설었지만 시행착오 속에서 많은 것을 배웠다.
    - **최현화**: 서버2 자동화 파트와 최종 병합·공통 인프라 구축을 맡아 실전적인 자동화 경험을 쌓았다. Airflow로 전체 파이프라인을 자동화하며 에러 처리와 장애 복구의 중요성을 체감했고, 생소한 구조 속에서도 매일 문제를 해결하며 안정적인 파이프라인을 완성했다. 이번 경험을 바탕으로 더 복잡하고 실전적인 MLOps 환경에 도전하고 싶다.
    - **장윤정**: 처음 접하는 도구가 많아 어려움이 있었지만, 매일 스크럼 회의를 통해 함께 고민하고 배워나가는 과정이 즐거웠다. 각 도구들의 동작과 연동 방식을 잘 모르는 상태에서 시작했지만, 문제를 해결하며 만족스러운 결과물을 완성했다.
