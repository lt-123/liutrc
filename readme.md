# liutrc

## 一些命令行

|             | 命令      | Darwin | Linux | MinGW / MSYS2 | desc                                        |
|:-----------:|---------|:------:|:-----:|:-------------:|---------------------------------------------|
| android dev | topa    |   Y    |   Y   |       Y       | 查看当前连接设备的栈顶 Activity 后可接参数设备的 SERIAL        |
|             | topa2   |   Y    |   Y   |       Y       | 同上，另一种方式                                    |
|             | lc      |   Y    |   Y   |       Y       | 查看 logcat 后可接参数过滤                           |
|             | dev     |   Y    |   Y   |       Y       | adb devices                                 |
|             | ins     |   Y    |   Y   |       Y       | adb install                                 |
|             | uins    |   Y    |   Y   |       Y       | adb uninstall                               |
|   system    | proxy   |   Y    |   Y   |       N       | 设置终端代理 127.0.0.1 后可接参数指定端口号                 |
|             | unproxy |   Y    |   Y   |       N       | 取消终端代理                                      |
|             | rm      |   Y    |   Y   |       Y       | 取代默认的 rm 命令，把指定文件/文件夹移动到回收站                 |
|             | rrm     |   Y    |   Y   |       Y       | 系统原始的 rm                                    |
|             | retry   |   Y    |   Y   |       Y       | 后接一个 shell 命令， 执行该命令，如果执行失败，则会自动再次执行，直到执行成功 |
|             | jdk8    |   Y    |   Y   |       Y       | 切换JDK到 Java 8 （需要自行修改路径）                    |
|             | jdk11   |   Y    |   Y   |       Y       | 切换JDK到 Java 11 （需要自行修改路径）                   |
|             | open    |   -    |   Y   |       Y       | 使用系统文件管理器打开当前路径                             |

## 安装

```shell
# curl
curl -fsSL https://raw.githubusercontent.com/lt-123/liutrc/master/install.sh | bash
# or wget
wget -nv -O - https://raw.githubusercontent.com/lt-123/liutrc/master/install.sh | bash
```


