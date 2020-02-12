# liutrc

## 一些命令行

- Android 相关
  - 环境变量配置 Mac `~/Library/Android/sdk` Linux `~/.Android/sdk`
  - `topa`、`topa2` 查看当前连接设备的栈顶 Activity 后可接参数设备的 SERIAL
  - `lc` 查看 log， 后可接参数过滤
  - `dev` = 'adb devices'
  - `ins` = 'adb install'
- 系统相关
  - `proxy` *仅Mac* 设置终端代理 127.0.0.1 后可接参数指定端口号 默认端口 1920
  - `unproxy` *仅Mac* 取消终端代理
  - `rm` 取代默认的 rm 命令，把指定文件/文件夹移动到回收站
  - `retry` 后接一个 shell 命令， 执行该命令，如果执行失败，则会自动再次执行，直到执行成功

## 安装

暂时只支持 zsh， 执行 install.sh 即可完成安装
