This test is based on ekknod's [drvscan](https://github.com/ekknod/drvscan), with added emulation detection for common devices. Thanks to ekknod for his contribution.Thanks to my good friend Hchai for providing the software interface and ideas.
# How to use
1. Run PowerShell as an administrator.
2. cd Release folder
3. Run `start.bat`.
4. Click the Check button and wait for the detection to complete (the interface may temporarily freeze during the detection).
The screenshot is as follows:
![[./images/capture.png]](./images/capture.png)

If the test passes, the results are as follows:
![[./images/pass.png]](./images/pass.png)
If the test fails, it will list the problematic devices as follows:
![[./images/fail.png]](./images/fail.png)
After the test is completed, ensure that the driver is properly uninstalled.
![[./images/exit.png]](./images/exit.png)

# FAQ
#### Q: The driver cannot be started
A: 1. Run Powershell as an administrator
   2. bcdeit /set testsigning on
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
