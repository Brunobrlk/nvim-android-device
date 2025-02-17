# nvim-android-device
A minimal neovim plugin that displays the connected android device's model name in the status line when working on a flutter project. Designed for Flutter developers who use neovim.

> [!NOTE]
> This plugin is to be used if and only if you are using [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim).


## Screenshot
Here is a preview of how the name of the attached android device is displayed in lualine.
<p>
<img src='./assets/lualine.png'/>
</p>


## Installation
Since the plugin is intended for use with [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim), we can add it as a dependency when installing [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim).

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nvim-lualine/lualine.nvim'
Plug 'biplab-dutta/nvim-android-device'
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'biplab-dutta/nvim-android-device' }
}
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'biplab-dutta/nvim-android-device' }
}
```

## Usage

> [!IMPORTANT]
> Users must have [adb](https://developer.android.com/tools/adb) installed on their system to use this plugin.

In the lualine config file,
```lua
local device = require 'nvim_android_device'
require('lualine').setup {
    sections = {
        lualine_a = {} -- Some config
        lualine_b = {} -- Some config
        lualine_c = {} -- Some config
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = false,
            update_in_insert = false,
            always_visible = false,
            cond = hide_in_width,
          },
          {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            cond = hide_in_width,
          },
          { 'encoding', cond = hide_in_width },
          { 'filetype', cond = hide_in_width },
          { device.android_model, cond = hide_in_width }, -- Invoke the function `android_model()` from nvim_android_device plugin
        },
    },
}
```

> [!NOTE]
> The position of the device model text can be customized based on the user's preference. In this example, it is placed at the bottom right of the screen, as shown in the [screenshot](#screenshot) above.