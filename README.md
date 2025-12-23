# Danil "Porkchop" Kostin NixOS Configuration
___
## Железо
Настоен под ноут с такими характеристиками:
```
┌──────────────────────Hardware──────┐
 PC  HP 470 G8 Notebook PC
│ ├  11th Gen Intel(R) Core(TM) i7-z
│ ├  Intel Iris Xe Graphics @ 1.30 ]
│ ├󱄄  1920x1080 in 17", 60 Hz [Built]
│ ├󰋊  36.81 GiB / 213.46 GiB (17%) -4
│ ├  5.08 GiB / 15.30 GiB (33%)
└ └󰓡  Swap Disabled 
└────────────────────────────────────┘
```
На других сборках может в теории криво встать.
Также в бут конфиге указан nodev grub, что тоже может не подойти многим
___
## Билд
Для установки системы из конфигурации используйте команду:
```shell
sudo nixos-rebuild switch --flake .#paragon
```
При необходимости всегда можно переключиться на старую деривацию системы в бут меню, либо откатившись командой:
```shell
sudo nixos-rebuild switch --rollback
```