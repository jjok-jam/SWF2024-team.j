# 01.init_fabric.sh 스크립트 파일은 hyperledger 샘플 프로젝트 실행을 위한 명령어

# 02.geno.block.sh 스크립트 파일은 genoblock 프로젝트의 hyperledger 실행을 위한 명령어

1. 02.geno.block.sh 스크립트 파일 안에 포함된 명령어를 실행하여, docker 기반 hyperledger 환경 구성
2. 환경 구동 완료 후 geno.clock.web 프로젝트 실행 후 org.team.j.geno.block 패키지의 HyperledgerFabricAPIClientTests 클래스의 enroll, register 함수를 차례로 실행
3. enroll 함수 실행 후 geno.block.api 프로젝트 내에 resources 폴더 하위 wallet 폴더에 admin.id 파일 생성
4. admin.id 파일은 org.team.j.geno.block.api.fabric 패키지 HyperledgerAPIController 클래스에서 사용
5. 웹 접속 주소

- http://localhost:18182/genoblock/main/#
- http://localhost:18182/genoblock/clinic/#
- http://localhost:18182/genoblock/user/#
- http://localhost:18182/genoblock/main/report#
