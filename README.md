# kubernetes-trino

## 0. 디렉토리 구조
```
.
├── hive
│   ├── init-schema.yaml
│   ├── metastore-cfg.yaml
│   ├── metastore-secret.yaml
│   └── metastore.yaml
│
├── mysql
│   └── mysql-deployment.yaml
│
├── python-trino
│   └── trino-python.ipynb
│
├── resources
│   ├── helm-values.yaml
│   └── trino-ingress.yaml
│
└── trino-commands.sh
```

## 1. 실습 및 구축 관련 내용 정리
- [Trino + Hive Metastore + MYSQL 배포 후 Trino로 Naver Object Storage 데이터 조회](https://velog.io/@newnew_daddy/K8S02)
## 2. MYSQL 배포
1. Secret 생성
    > kubectl create secret generic secret-mysql \
        --from-literal MYSQL_PASSWORD=[비밀번호] \
        --from-literal MYSQL_ROOT_PASSWORD=[Root 비밀번호] 

2. MYSQL 배포
    > kubectl apply -f ./mysql/mysql-deployment.yaml

## 3. MYSQL내 Hive Schema init
> kubectl apply -f ./hive/init-schema.yaml

## 4. Hive-metastore 배포
1. configmap apply
    > kubectl apply -f ./hive/metastore-cfg.yaml

2. secret apply
    > kubectl create secret generic [secret 이름] \
    --from-literal=access-key=[NCP API KEY ID] \
    --from-literal=secret-key=[NCP API SECRET KEY]

3. deployment apply
    > kubectl apply -f ./hive/metastore.yaml

## 5. Helm으로 Trino 배포
