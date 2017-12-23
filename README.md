# Kernel Automation Upgrader in Ubuntu

kernel.org에서 제시한 Latest Stable Kernel 버전으로 Ubuntu 계열의 OS Kernel을 자동 업그레이드 해주는 도구


## Getting Started

본 체계는 Python3와 Bash Shell 기반으로 제작되었습니다.

### Prerequisites

실행하기 전 필요한 소프트웨어 목록 및 설치법

```
python3.x

sudo apt-get install -y python3
```

### Installing

Python3, pip를 설치한 이후 필요한 라이브러리 목록과 설치는 스크립트에 의해 자동 설치됨.

## Upgrade the Kernel


### Running the shell
```
sudo ./upgrader.sh
```

### Reboot 이후의 Kernel version 확인

```
uname -a

또는

uname -r
```


