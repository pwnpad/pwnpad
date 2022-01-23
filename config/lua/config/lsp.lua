-- Settings
vim.g.coq_settings = {
    auto_start = "shut-up",
    clients = {
        tabnine = {
            enabled = true,
        },
    },
    display = {
        mark_highlight_group = "COQMarks",
    },
    keymap = {
        recommended = false,
        jump_to_mark = "<c-x>",
    },
}

local coq = require("coq")
local coq_3p = require("coq_3p")
local lspinstall = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.on_server_ready(function(server)
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            if client.name == "jdtls" then
                require("jdtls").setup_dap({ hotcodereplace = "auto" })
                require("jdtls.dap").setup_dap_main_class_configs()
            end
        end,
    }

    if server.name == "texlab" then
        config.settings = {
            texlab = {
                build = {
                    args = { "-halt-on-error", "%f" },
                    executable = "pdflatex",
                    onSave = true,
                },
            },
        }
    elseif server.name == "html" or server.name == "emmet_ls" then
        config.filetypes = { "html", "css", "javascriptreact" }
    elseif server.name == "jdtls" then
        config.init_options = {
            bundles = {
                vim.fn.glob(
                    vim.fn.stdpath("data")
                        .. "/dapinstall/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
                ),
            },
            extendedCapabilities = require("jdtls").extendedClientCapabilities,
        }
    end

    server:setup(coq.lsp_ensure_capabilities(config))
end)

coq_3p({
    { src = "copilot", short_name = "COP", accept_key = "<C-f>" },
})

require("lspsaga").init_lsp_saga({
    finder_action_keys = {
        open = { "<CR>", "o" },
        quit = { "q", "<esc>", "<C-c>" },
    },
    code_action_keys = {
        quit = { "q", "<esc>", "<C-c>" },
    },
    rename_action_keys = {
        quit = { "<esc>", "<C-c>" },
    },
})
