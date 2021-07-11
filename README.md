# Device Tree for Nokia 8 treble

The Nokia 8 is a high-end Nokia-branded smartphone running the Android operating system
Announced on 16 August 2017 in London, England by HMD Global,[4][5] the phone began sales in Europe in September 2017.

| Basic                   | Spec Sheet                                                                                                                     |
| -----------------------:|:------------------------------------------------------------------------------------------------------------------------------ |
| CPU                     | Octa-core (4x2.5 GHz Kryo & 4x1.8 GHz Kryo)                                                                           |
| Chipset                 | Qualcomm MSM8998 Snapdragon 835 (10 nm)                                                                                                 |
| GPU                     | Adreno 540                                                                                                                     |
| Memory                  | 4/6 GB RAM                                                                                                                     |
| Shipped Android Version | Android 7.1.1 (Nougat)                                                                                                                            |
| Storage                 | 64/128 GB                                                                                                                          |
| Battery                 | Non-removable Li-Ion 3090 mAh battery                                                                                           |
| Display                 | 1440 x 2560 pixels, 16:9 ratio (~554 ppi density)                                                                              |
| Camera (Back)           | 13 MP, f/2.0, 1/3.1", 1.12µm, PDAF, Laser AF, OIS                                                                              |
| Camera (Front)          | 13 MP, f/2.0, (wide), 1/3.1", 1.12µm, PDAF                                                                                                    |

![Nokia 8](https://static.wikia.nocookie.net/hmd_nokia/images/f/f1/Nb1.png/revision/latest?cb=20200529024823)

## Compile

First download omni-9.0 tree and sync the sources:

```
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
repo sync -c --no-tags --no-clone-bundle -j$(nproc --all)
```

Then clone the device tree and it's dependencies:

```
git clone https://github.com/resident-nokia/android_device_nokia_NB1T-TWRP device/nokia/NB1
git clone -b android-9.0 https://github.com/TeamWin/android_device_qcom_twrp-common device/qcom/twrp-common
```

Finally build the recovery image:

```
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_NB1-eng
mka -j$(nproc --all) recoveryimage 
```

To test it:

```
fastboot flash:raw boot $OUT/recovery.img
```

Profit?

Kernel Source: https://github.com/GPUCode/android_kernel_nokia_msm8998

## Credits
 * TeamWin Team
 * Omni Team
 * XDA Forums
 * Dees-Troy
 * HikariCalyx
 * sjrmac
 * bidhata
 * cosmicdan
 * wuxianlin
 * dg28gadhavi
 * Dorian Stoll
 * GPUCode