# kawm

## The wm that does it all.

# Design goals/philosophies

- Stop with the clusterfuck, this window manager do not seek to further satisfy YT Shorts kids' urgent need to have 10-or-so workspaces open for "efficiently productive" multitasking.
- One workspace per monitor, that's it. Got more backlog of work left to be done? Then just note them down. [ Taskwarrior TUI ](https://github.com/kdheepak/taskwarrior-tui) is one hell of a tool for that.
- This may appear to be quite odd to some but I want to be able to control charging by manipulating the value of `/sys/class/power_supply/BAT0/charge_behaviour` to stop charging on-the-go. (Say you have thresholds set to 80% for max charge but you're at 50% and want to conserve your battery cycle)

> See ./.tasks for the todo list

# Anvil

A compositor used as a testing ground for new smithay features.
For a simple example compositor consider reading [smallvil](https://github.com/Smithay/smithay/tree/master/smallvil)

## Dependencies

You'll need to install the following dependencies (note, that those package
names may vary depending on your OS and linux distribution):

- `libwayland`
- `libxkbcommon`

#### These are needed for the "Udev/DRM backend"

- `libudev`
- `libinput`
- `libgbm`
- [`libseat`](https://git.sr.ht/~kennylevinsen/seatd)

If you want to enable X11 support (to run X11 applications within kawm),
then you'll need to install the following packages as well: - `xwayland`

## Build and run

You can run it with cargo after having cloned this repository:

```
cd kawm;

cargo run -- --{backend}
```

The currently available backends are:

- `--winit`: start kawm as a [Winit](https://github.com/tomaka/winit) application. This allows you to run it
  inside of an other X11 or Wayland session.
- `--tty-udev`: start kawm in a tty with udev support. This is the "traditional" launch of a Wayland
  compositor. Note that this requires you to start kawm as root if your system does not have logind
  available.

### Supported Environment Variables

| Variable                     | Example        | Backends |
| ---------------------------- | -------------- | -------- |
| ANVIL_DRM_DEVICE             | /dev/dri/card0 | tty-udev |
| ANVIL_DISABLE_10BIT          | any            | tty-udev |
| ANVIL_DISABLE_DIRECT_SCANOUT | any            | tty-udev |
| SMITHAY_USE_LEGACY           | 1,true,yes,y   | tty-udev |
| SMITHAY_VK_VERSION           | 1.3            |          |
