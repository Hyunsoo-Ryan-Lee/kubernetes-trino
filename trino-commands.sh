<<구축 순서 >>

mysql
    - /root/workspace/trinodb/mysql/mysql-deployment.yaml

init schema 
    - /root/workspace/trinodb/metastore/init-schema.yaml
-----
hive metastore
    - /root/workspace/trinodb/metastore/metastore-cfg.yaml
    - /root/workspace/trinodb/metastore/metastore-secret.yaml
    - /root/workspace/trinodb/metastore/metastore.yaml

overriding한 trino helm
    - /root/workspace/helm/trino-helmchart/
    - helm install trino -f my-values.yaml .

trino에서 nos 테이블 스키마 생성

    SHOW CATALOGS;

    use lakehouse.default;

    create table lakehouse.default.allstarfull(
            playerID VARCHAR,
            yearID VARCHAR,
            gameNum VARCHAR,
            gameID VARCHAR,
            teamID VARCHAR,
            lgID VARCHAR,
            GP VARCHAR,
            startingPos VARCHAR
    )
    with (
    external_location = 's3a://testtesttesttest/hive-meta/allstarfull',
    format = 'CSV'
    );


조회
    select * from lakehouse.default.allstarfull limit 10;