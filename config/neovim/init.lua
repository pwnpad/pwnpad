--
--                              I8         ,dPYb,
--                              I8         IP'`Yb
--   gg                  gg  88888888      I8  8I
--   ""                  ""     I8         I8  8'
--   gg    ,ggg,,ggg,    gg     I8         I8 dP  gg      gg    ,gggg,gg
--   88   ,8" "8P" "8,   88     I8         I8dP   I8      8I   dP"  "Y8I
--   88   I8   8I   8I   88    ,I8,        I8P    I8,    ,8I  i8'    ,8I
-- _,88,_,dP   8I   Yb,_,88,_ ,d88b,  d8b ,d8b,_ ,d8b,  ,d8b,,d8,   ,d8b,
-- 8P""Y88P'   8I   `Y88P""Y888P""Y88 Y8P 8P'"Y888P'"Y88P"`Y8P"Y8888P"`Y8

if vim.fn.has('nvim-0.7') == 1 then
    require("options")

    local status_ok, _ = pcall(require, "plugins")
    if not status_ok then
        return
    end

    require("mappings")
    require("autocmd")
    require("functions")
else
    print("Please use Neovim 0.7")
end
