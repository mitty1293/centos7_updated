# centos7_updated

centos:7イメージにパッケージアップデート、ssh接続設定、X11の設定を実施済。 
動作確認（ping-tの解説確認等）で使う。 

## to build
```
docker build -t mitty1293/centos7_updated .
```
## to run
```
docker run -d -p <localport>:22 --name <container name> mitty1293/centos7_updated
```
