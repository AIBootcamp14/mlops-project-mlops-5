global:
  scrape_interval: 15s              # [필수] 메트릭 수집 주기 (기본값 15초)
#  evaluation_interval: 15s         # [옵션] 알림 규칙 평가 주기 (기본값 15초)

scrape_configs:                     # [필수] 스크랩 대상(Target) 목록
# server1 - workhorse
  - job_name: 'workhorse-node-exporter'
    static_configs:
      - targets: ['${WORKHORSE_IP}:9100']

  - job_name: 'workhorse-log-metrics' # promtail metrics (로그 기반 메트릭)
    static_configs:
      - targets: ['${WORKHORSE_IP}:9080']

# server2 - controltower
  - job_name: 'controltower-node-exporter'
    static_configs:
      - targets: ['${CONTROLTOWER_IP}:9100']

  - job_name: 'controltower-log-metrics' # promtail metrics (로그 기반 메트릭)
    static_configs:
      - targets: ['${CONTROLTOWER_IP}:9080']

# server3 - monitoring
  - job_name: 'monitoring-node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']

# alertmanager
rule_files:
  - 'alert-rules.yml'

alerting:
  alertmanagers:
    - static_configs:
        - targets:
            - "alertmanager:9093"