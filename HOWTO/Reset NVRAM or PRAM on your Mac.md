This article applies only to [Mac computers with an Intel processor](https://support.apple.com/kb/HT211814).

NVRAM (nonvolatile random-access memory) is a small amount of memory that your Mac uses to store certain settings and access them quickly. PRAM (Parameter RAM) stores similar information, and the steps for resetting NVRAM and PRAM are the same.

Settings that can be stored in NVRAM include sound volume, display resolution, startup-disk selection, time zone, and recent kernel panic information. The settings stored in NVRAM depend on your Mac and the devices that you're using with your Mac.

If you experience issues related to these settings or others, resetting NVRAM might help. For example, if your Mac starts up from a disk other than the one selected in Startup Disk preferences, or a question mark icon briefly appears before your Mac starts up, you might need to reset NVRAM.

How to reset NVRAM
------------------

![Option key](resources/1BF89620CDC28BEA398E026DF90BC2D0.png)![plus](resources/357C0068DF74921158FC52B686AC1CB5.png)![Command key](resources/DF43E9DCA3FEFA98155A89911A65FAD3.png)![plus](resources/357C0068DF74921158FC52B686AC1CB5.png)![P key](resources/89B6EAF59C7E67CADA2B094053B1CF2E.png)![plus](resources/357C0068DF74921158FC52B686AC1CB5.png)![R key](resources/D46FA5826D10746D17922B82EF4F0513.png)

Shut down your Mac, then turn it on and immediately press and hold these four keys together: Option, Command, P, and R. You can release the keys after about 20 seconds, during which your Mac might appear to restart.

* On Mac computers that play a startup sound, you can release the keys after the second startup sound.
* On [Mac computers that have the Apple T2 Security Chip](https://support.apple.com/kb/HT208862), you can release the keys after the Apple logo appears and disappears for the second time.

If your Mac is using a [firmware password](https://support.apple.com/kb/HT204455), this key combination does nothing or causes your Mac to start up from [macOS Recovery](https://support.apple.com/kb/HT201314). To reset NVRAM, first turn off the firmware password.

When your Mac finishes starting up, you might want to open System Preferences and adjust any settings that were reset, such as sound volume, display resolution, startup disk selection, or time zone.

Learn more
----------

* If you're using a desktop Mac instead of a notebook, and settings such as sound volume or time zone are reset every time you shut down and unplug your Mac, you might need to replace the battery inside your Mac. This small battery is on your computer's logic board, and it helps NVRAM retain settings when your Mac is unplugged. You can take your Mac to an Apple service provider to replace the battery.
* If you experience issues with sleep, wake, power, charging your Mac notebook battery, or other power-related symptoms, you might need to [reset the SMC (System Management Controller)](http://support.apple.com/kb/HT201295).