# **MLOps Project - Movie Prediction (Team 5, 3X+Y)**

- **프로젝트 기간:** 2025.07.28 ~ 2025.08.08

- **GitHub:** [3X+Y MLOps Project Team Repository](https://github.com/AIBootcamp14/mlops-project-mlops-5)

- **React 배포 결과:**

![react_main](https://github.com/user-attachments/assets/0341d28b-9d99-48b4-9c72-0cb27e38771f)
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

### **7.2 실행 결과**

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

- React App 시연

https://github.com/user-attachments/assets/df210b4e-fe9b-4954-95fc-d42d0cbe26b0

### **7.3 한계 및 회고**

- Feast Feature Store, CI/CD(GitHub Actions)는 시간/환경 문제로 미구현
- 서버3(모니터링)는 Prometheus, Grafana, Loki만 적용, 로그 메트릭화 및 Alert는 성공
- 전체 서비스는 Docker Compose로 서버별 4개 컨테이너씩 환경변수 기반 통합 실행
- 데이터 백업 및 모델 아카이빙은 S3에 병렬로 저장
- 팀원별 역할 분담 및 병렬 개발/통합 경험, 실제 실무 DevOps·MLOps 핵심 역량 강화
