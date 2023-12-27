# kubernetes-trino

## 0. 실습 내용 정리
- [Trino + Hive Metastore + MYSQL 배포 후 Trino로 Naver Object Storage 데이터 조회](https://velog.io/@newnew_daddy/K8S02)
## 1. MYSQL 배포
1. Secret 생성
    > kubectl create secret generic secret-mysql \
        --from-literal MYSQL_PASSWORD=[비밀번호] \
        --from-literal MYSQL_ROOT_PASSWORD=[Root 비밀번호] 

2. MYSQL 배포
    > kubectl apply -f ./mysql/mysql-deployment.yaml

## 2. MYSQL내 Hive Schema init
> kubectl apply -f ./hive/init-schema.yaml

## 3. Hive-metastore 배포
1. configmap apply
    > kubectl apply -f ./hive/metastore-cfg.yaml

2. secret apply
    > kubectl create secret generic [secret 이름] \
    --from-literal=access-key=[NCP API KEY ID] \
    --from-literal=secret-key=[NCP API SECRET KEY]

3. deployment apply
    > kubectl apply -f ./hive/metastore.yaml

## 4. Helm으로 Trino 배포
