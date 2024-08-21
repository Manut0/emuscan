<div align="center">
<h1>EmuScan</h1>
<a href="http://cppmicroservices.org/"><img alt="C Language" src="https://img.shields.io/badge/-C-black?logo=c&style=flat-square&logoColor=ffffff"></a>
<a href="http://cppmicroservices.org/"><img alt="C++ Language" src="https://img.shields.io/badge/-C++-808080?logo=c%2B%2B&style=flat-square&logoColor=ffffff"></a>
<a href="https://discord.gg/AaRx5CSRru"><img alt="加入Discord频道" src="https://img.shields.io/badge/Join%20group-Discord-brightgreen.svg?logo=Discord"></a>
<p><b><a href="README.md">English</a> | <a href="README-zh.md">简体中文</a></b></p>
<p>该测试基于 Ekknod 的 [drvscan]，并增加了对常见设备的仿真检测。感谢 Ekknod 的贡献。感谢我的好朋友 HChai 提供的软件界面和创意。
</p>
</div>


## ✨重要功能
- 检测DMA伪装的设备
- 激活固件(未来添加)


## 💡说明
- 双击进入 emuscan 文件夹。
- 右键管理员运行 `start.bat`。
![[./images/start.png]](./images/start.png)
- 如果驱动加载成功，显示如下：
![[./images/success.png]](./images/success.png)
- 点击“Check”按钮，等待检测完成（检测过程中界面可能会暂时卡住）。
- 如果驱动加载失败可以运行`backup.bat` win11推荐

截图如下：
![[./images/capture.png]](./images/capture.png)

如果测试通过，结果如下：
![[./images/pass.png]](./images/pass.png)
如果测试失败，将列出有问题的设备，如下所示：
![[./images/fail.png]](./images/fail.png)
测试完成后，请确保正确卸载驱动程序。
![[./images/exit.png]](./images/exit.png)

## 🔍常见问题
#### 问题：驱动无法启动
**解决方法：**
1. 以管理员身份运行 PowerShell

2. 输入命令 `bcdedit /set testsigning on`

3. 重启电脑

4. 重启后，屏幕右下角会显示测试模式。再次运行 `start.bat`。

#### 问题：如何查看检测结果？
**解决方法：** 检测结果只会列出有问题的设备。如果未列出任何PCIe设备，则说明您的固件已通过检测。

#### 问题：什么是 Dumb 仿真？
**解答：** “Dumb 仿真”指的是当你的 BAR（基址寄存器）响应来自 RW Everything 或 Arbor 扫描结果的请求时，这种响应方式能够使驱动正确加载。然而，这种响应方式绕过了一些必要的驱动加载过程，并未完全响应整个驱动加载程序。

#### 问题：为什么我的固件不能“呼吸”？
**解答：** 在我分享了让固件“活跃”的方法后，很多人问我为什么他们的固件在使用该方法后仍然无法通过 EKK 的呼吸检测。在回答这个问题之前，我需要补充一些关于中断的理论知识。

中断信号是一种特殊的异步信号，当 CPU 捕获到该信号后，会查询与该信号相关的中断服务例程（ISR）。在 PCIe 设备中，当驱动确认设备已准备好与 CPU 交互时，通常会在驱动内部绑定这个 ISR。在 Linux 系统中，这个函数通常称为 `device_open`。

因此，如果你希望固件通过呼吸检测，你需要确保你的 BAR（基址寄存器）响应能够让驱动认为设备已经准备好与 CPU 进行 DMA 交互。这意味着你的设备必须正确模拟驱动预期的行为，使驱动能够继续执行，仿佛设备已完全正常运行。

#### 问题：如何解决该问题？
**解决方法：** 尝试调试驱动程序或寻求专业开发者的帮助。

#### 问题：如果我的固件通过了检测，是否意味着这是一个完全仿真的固件？
**解答：** 我的检测只覆盖了常见设备。要判断一个固件是否是完全仿真，必须模拟驱动加载过程。如果你的固件通过了测试，请随时告诉我，我会在未来的检测中加入相应的固件检测。

#### 问题：这个测试会用于反作弊吗？
**解答：** 正如 EKK 所述，开发固件和检测固件需要类似的技术。如果你想开发能够绕过反作弊系统的固件，你需要了解反作弊系统检测的内容。同样地，如果你想检测固件，你需要清楚当前 pcileech-fpga 代码的局限性。毫不夸张地说，所有当前的固件都源自 pcileech-fpga。大多数开发者只是简单地复制影子 CFG 和 CFG 掩码，使用 RW Everything 从设备获取 BAR 响应来创建固件。这类固件通常被宣传为完全仿真，给人的印象是只要驱动正确加载，固件就被认为是完全仿真。FPGA 的发展潜力是无限的，使用正确的开发技术，你可以模拟任何状态下的任何设备，甚至是已连接的状态。我故意使用影子 CFG 技术来证明这个网卡是由固件模拟的，而不是一个真实的设备。
![[./images/nic.png]](./images/nic.png)

## 🎉支持
#### 致谢
- @HChai [(Telegram)](https://t.me/HCha1)
- @AceKingSuited [(Discord)](https://discord.gg/AaRx5CSRru)
#### 赞助者
- @Li 腾讯QQ: 81666660 [(QQ)](https://qm.qq.com/q/59sRjPI8pa)
- @Scarlet [(网站)](https://scarlet.technology/)
- @Kilmu1337 [(Discord)](https://discord.gg/sXeTPJfpaN)
- @iThaClan [(Discord)](https://discord.gg/ithaclan)