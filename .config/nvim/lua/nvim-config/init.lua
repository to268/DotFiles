require("nvim-config.options")
require("nvim-config.lazy")
require("nvim-config.autogroups")
require("nvim-config.remaps")

function R(name)
    require("plenary.reload").reload_module(name)
end
