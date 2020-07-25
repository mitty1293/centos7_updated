# ベースイメージ
FROM centos:7

LABEL maintainer="fmichi"

# 環境変数

# 必要パッケージのインストール
RUN set -x && \
    yum -y update &&  yum clean all && \
    yum -y install which \
    iproute \
    net-tools \
    vim \
    openssh-server \
    xauth \
    libXtst \
    libXrender \
    xeyes && \
    yum clean all

# ホストキーを作成 使わなくても作成する必要がある
RUN set -x && \
    /usr/sbin/sshd-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

# rootでログイン出来るようにする
RUN set -x && \
    sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# root のパスワード設定
RUN set -x && \
    echo 'root:centos' |chpasswd

# xwindowの設定
RUN set -x && \
    sed -i -e "s/^\#AddressFamily any/AddressFamily inet/" /etc/ssh/sshd_config

# ポート22解放
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
