# nvim-android-device (Fork)

This is a **fork** of [Biplab-Dutta/nvim-android-device](https://github.com/Biplab-Dutta/nvim-android-device) with extended project detection.

## ✨ Differences from upstream

- Detects **both Flutter and Android projects**.
- Android projects are recognized by the presence of a `build.gradle*` file containing the word `"android"`.

## 🔧 Installation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "brunobrlk/nvim-android-device",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  }
}
