This test is based on ekknod's [drvscan](https://github.com/ekknod/drvscan), with added emulation detection for common devices. Thanks to ekknod for his contribution.Thanks to my good friend Hchai for providing the software interface and ideas.
# How to use
1. Run PowerShell as an administrator.
2. cd Release folder
3. Run `start.bat`.
![[./images/start.png]](./images/start.png)
4. If the driver loads successfully, it will display as follows.
![[./images/success.png]](./images/success.png)
5. Click the Check button and wait for the detection to complete (the interface may temporarily freeze during the detection).
The screenshot is as follows:
![[./images/capture.png]](./images/capture.png)

If the test passes, the results are as follows:
![[./images/pass.png]](./images/pass.png)
If the test fails, it will list the problematic devices as follows:
![[./images/fail.png]](./images/fail.png)
After the test is completed, ensure that the driver is properly uninstalled.
![[./images/exit.png]](./images/exit.png)
# Backup
1. Run PowerShell as an administrator.
2. cd Release folder
3. Run `backup.bat`.
![[./images/backup.png]](./images/backup.png)
4. If the driver loads successfully, it will display as follows.
![[./images/start.png]](./images/sucess.png)
5. Click the Check button and wait for the detection to complete (the interface may temporarily freeze during the detection).

# FAQ
#### Q: The driver cannot be started
A: 1. Run Powershell as an administrator

   2. bcdedit /set testsigning on

   3. reboot

   4. After rebooting, the test mode is displayed in the lower right corner of the screen. Run `start.bat` again.
   
#### Q: How to read the detecting results?
A: The detecting results only list problematic devices. If no PCIe devices are listed, it means your firmware has passed the detection.
#### Q: What is dumb emulation?
A: "Dumb emulation" refers to when your BAR (Base Address Register) responds to requests from RW Everything or Arbor scan results. This type of response allows the  driver to load correctly. However, this type of response bypasses some necessary driver loading processes and does not fully respond to the entire driver loading procedure.
#### Q: Why my firmawre can not breath?
A: After I shared the method to make your firmware "active," many people asked me why their firmware still couldn't pass EKK's breathing detection after using the method. Before answering this question, I need to add some theoretical knowledge about interrupts.

An interrupt signal is a special asynchronous signal that, when captured by the CPU, prompts the CPU to query the interrupt service routine (ISR) associated with that signal. In PCIe devices, this ISR is typically bound within the driver when the driver confirms that the device is ready to interact with the CPU. In Linux, this function is usually referred to as `device_open`.

Therefore, if you want your firmware to pass the breathing detection, you need to ensure that your BAR (Base Address Register) response can convince the driver that the device is ready to interact with the CPU via DMA. This means your device must be correctly emulating the behavior expected by the driver, allowing the driver to proceed as if the device is fully operational.
#### Q: How to fix the issue?
A: Try debugging the driver or seek help from a professional developer.
#### Q: If my firmware passes the detection, does it mean that this is a FULL emulation firmware?
A: My detection only covered common devices. To determine if a firmware is FULL emulation, it's necessary to simulate the driver loading process. If your firmware passes the test, feel free to inform me, and I'll include the corresponding firmware detections in the future.
#### Q: Will this test be used for anti-cheat purposes?
A: As EKK mentioned, developing firmware and detecting firmware require similar techniques. If you want to develop firmware that can bypass anti-cheat systems, you need to understand what the anti-cheat systems are detecting. Similarly, if you want to detect firmware, you need to be aware of the current limitations of the pcileech-fpga code. It’s not an exaggeration to say that all current firmware originates from pcileech-fpga. Most developers simply copy the shadow CFG and CFG mask, using RW Everything to obtain the BAR response from the device to create firmware. These types of firmware are often advertised as FULL emulation, giving the impression that as long as the driver loads correctly, the firmware is considered FULL emulation.The development potential of FPGA is limitless. With the right development techniques, you can simulate any device in any state, even in a connected state. I intentionally used shadow CFG technology to demonstrate that this NIC is emulated by firmware rather than being an real device.
![[./images/nic.png]](./images/nic.png)
# Credit
@Hchai (Telegram: https://t.me/HCha1)

@AceKingSuited (Discord id ace_king_suited/Channel Link: https://discord.gg/AaRx5CSRru)

# Sponsor
Li (TecentQQ ID:81666660/Channel Link:https://qm.qq.com/q/59sRjPI8pa)

Scarlet (Website: https://scarlet.technology/)

Kilmu1337(Discord Channel Link: https://discord.gg/sXeTPJfpaN)

iThaClan(Discord Channel Link:https://discord.gg/ithaclan)

# This Chinese translation was done by GPT.
该测试基于 Ekknod 的 [drvscan](https://github.com/ekknod/drvscan)，并增加了对常见设备的仿真检测。感谢 Ekknod 的贡献。感谢我的好朋友 Hchai 提供的软件界面和创意。

# 使用方法
1. 以管理员身份运行 PowerShell。
2. 进入 emuscan 文件夹。
3. 运行 `start.bat`。
![[./images/start.png]](./images/start.png)
4. 如果驱动加载成功，显示如下：
![[./images/success.png]](./images/success.png)
5. 点击“Check”按钮，等待检测完成（检测过程中界面可能会暂时卡住）。
# 备用
1. 以管理员身份运行 PowerShell。  
2. 进入 emuscan 文件夹。  
3. 运行 `backup.bat`。  
![[./images/backup.png]](./images/backup.png)  
4. 如果驱动加载成功，将显示如下：  
![[./images/success.png]](./images/success.png)  
5. 点击“Check”按钮，等待检测完成（检测过程中界面可能会暂时卡住）。

截图如下：
![[./images/capture.png]](./images/capture.png)

如果测试通过，结果如下：
![[./images/pass.png]](./images/pass.png)
如果测试失败，将列出有问题的设备，如下所示：
![[./images/fail.png]](./images/fail.png)
测试完成后，请确保正确卸载驱动程序。
![[./images/exit.png]](./images/exit.png)
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
# 致谢
@Hchai (Telegram: https://t.me/HCha1)

@AceKingSuited (Discord ID: ace_king_suited / 频道链接: https://discord.gg/AaRx5CSRru)

# 赞助者
Li (腾讯QQ ID: 81666660 / 频道链接: https://qm.qq.com/q/59sRjPI8pa)

Scarlet (网站: https://scarlet.technology/)

Kilmu1337 (Discord 频道链接: https://discord.gg/sXeTPJfpaN)

iThaClan (Discord 频道链接: https://discord.gg/ithaclan)