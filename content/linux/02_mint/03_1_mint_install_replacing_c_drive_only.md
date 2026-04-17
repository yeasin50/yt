---
title: "Replace windows with Linux"
description: "Only format C drive"
draft: false
weight: 3
---

এই ভিডিওতে আমরা দেখেছি কিভাবে Windows সরিয়ে **Linux Mint clean install করা যায়**, শুধুমাত্র C: drive format করে।

{{< youtube 1ttX7vB2bxg >}}

### Verify EFI contents

```sh
ls /boot/efi/EFI`

# Remove ONLY Windows EFI boot files
sudo rm -rf /boot/efi/EFI/Microsoft

# Remove Windows Boot Manager entry from UEFI
sudo efibootmgr -b 0000 -B

# Set Ubuntu as default boot entry
sudo efibootmgr -o 0003

# Verify final state
sudo efibootmgr
ls /boot/efi/EFI
```

### Remove EFI files

```sh
# mount
sudo  mount | grep  efi

# check  boot efi
sudo  ls /boot/efi/EFI

# remove the micr
sudo  rm -rf /boot/efi/EFI/Microsoft

# Verify
sudo efibootmgr
```
