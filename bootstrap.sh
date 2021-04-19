#!/usr/bin/sh

sgdisk --zap-all /dev/sda
sgdisk -o /dev/sda
sgdisk -n 1:0:+256M -t 1:ef00 -N 2 -t 2:8300 /dev/sda

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux-lts linux-firmware neovim
