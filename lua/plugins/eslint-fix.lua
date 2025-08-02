return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            experimental = {
              useFlatConfig = false,
            },
          },
          on_attach = function(client, bufnr)
            -- Only enable ESLint if config file exists
            local config_files = {
              ".eslintrc.js",
              ".eslintrc.cjs", 
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              ".eslintrc",
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
              "eslint.config.ts",
              "eslint.config.mts",
              "eslint.config.cts",
            }
            
            local root_dir = client.config.root_dir
            if not root_dir then return end
            
            local has_config = false
            for _, config_file in ipairs(config_files) do
              if vim.fn.filereadable(root_dir .. "/" .. config_file) == 1 then
                has_config = true
                break
              end
            end
            
            -- Also check package.json for eslint config
            local package_json = root_dir .. "/package.json"
            if vim.fn.filereadable(package_json) == 1 then
              local ok, content = pcall(vim.fn.readfile, package_json)
              if ok and content then
                local json_str = table.concat(content, "\n")
                if json_str:find('"eslintConfig"') then
                  has_config = true
                end
              end
            end
            
            if not has_config then
              -- Disable ESLint if no config found
              client.stop()
              return
            end
          end,
        },
      },
    },
  },
}