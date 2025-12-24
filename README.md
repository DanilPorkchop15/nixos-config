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
└ └󰓡  256.00 KiB / 8.00 GiB (0%)
└────────────────────────────────────┘
```
На других сборках может в теории криво встать.
Также в бут конфиге указан nodev grub, что тоже может не подойти многим
___
## Билд
Обязательно сгенерируйте СВОЙ `hardware-configuration.nix` в корне проекта командой:
```shell
nixos-generate-config --show-hardware-config > hardware-configuration.nix
```
Для установки системы из конфигурации используйте команду:
```shell
sudo nixos-rebuild switch --flake .#paragon
```
При необходимости всегда можно переключиться на старую деривацию системы в бут меню, либо откатившись командой:
```shell
sudo nixos-rebuild switch --rollback
```
___
## Niri
Чтобы посмотреть основные кейбинды, нажмите `super + shift + /`.
Чтобы полностью посмотреть конфиг со всеми биндами, читайте файл `/home/porkchop/dotfiles/niri/config.kdl` репозитория или `~/.config/niri/config.kdl` уже установленной системы.
___
## Дерево файлов:
```
.
├── configuration.nix          # Корневой файл NixOS: импортирует все модули и home-manager конфиг
├── flake.lock                 # Фиксация точных версий всех зависимостей (nixpkgs, home-manager, niri-flake и т.д.)
├── flake.nix                  # Основной flake: inputs, outputs, определение nixosConfigurations.paragon
├── hardware-configuration.nix # Автогенерируемый файл с аппаратной конфигурацией системы
├── home                       # Конфигурация Home Manager
│   ├── default.nix            # Импорт конфигурации пользователя porkchop
│   └── porkchop               # Пользовательская конфигурация porkchop
│       ├── default.nix        # Главный файл пользователя: stateVersion + импорты всех HM-модулей
│       ├── dotfiles           # Исходники всех конфигурационных файлов приложений
│       │   ├── fastfetch/config.jsonc  # Конфигурация fastfetch (в стиле Omarchy, адаптировано под NixOS)
│       │   ├── fuzzel/fuzzel.ini       # Конфигурация fuzzel (лаунчер/меню)
│       │   ├── ghostty/config          # Конфигурация терминала Ghostty
│       │   ├── mako/config             # Конфигурация уведомлений mako
│       │   ├── niri/config.kdl         # Основная конфигурация Niri (Wayland-композитор)
│       │   ├── swaylock/config         # Конфигурация экрана блокировки swaylock-effects
│       │   └── waybar                  # Конфигурация панели Waybar
│       │       ├── config.jsonc
│       │       └── style.css
│       ├── dotfiles.nix       # Модуль: копирует всю папку dotfiles в ~/.config/ (recursive)
│       ├── packages.nix       # Пакеты пользователя (home.packages)
│       ├── programs.nix       # Включение и настройка программ (zsh, zoxide, fastfetch и т.д.)
│       ├── scripts.nix        # Пользовательские скрипты (nmtui, powermenu, wall-next, wlsunset-toggle)
│       ├── services.nix       # Пользовательские сервисы (swayidle и др.)
│       ├── theme.nix          # Тема GTK, курсор (Bibata), цвета
│       ├── wallpapers         # Папка с обоями для скрипта wall-next, после установки она находится в ~/Pictures/wallpapers
│       │   └── wallpaper.jpg
│       └── xdg.nix            # Настройка MIME-типов, xdg-portal и дефолтных приложений
├── modules                    # Системные NixOS-модули
│   ├── boot.nix               # Настройки загрузчика (GRUB, EFI)
│   ├── default.nix            # Импорт всех системных модулей (для удобства)
│   ├── fonts.nix              # Системные шрифты (JetBrains Mono Nerd Font и др.)
│   ├── hardware.nix           # Аппаратные настройки (graphics, bluetooth и т.д.)
│   ├── networking.nix         # Сеть (NetworkManager, hostname, timezone)
│   ├── packages.nix           # Системные пакеты (environment.systemPackages)
│   ├── programs.nix           # Системные программы (niri, firefox, zsh и т.д.)
│   ├── services.nix           # Системные сервисы (pipewire, sddm, docker, v2raya и т.д.)
│   └── swap.nix               # Настройка /swapfile
└── README.md                  # Документация проекта: структура, как применять, особенности
```
___
#### TODO: 
- [x] починить тему (в трее вейбара менюшки приложений светлые)
- [ ] разобраться, почему стим и майнкрафт 1.12.2 не запускаются
