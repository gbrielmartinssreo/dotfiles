local jdtls = require("jdtls")
local jdtls_setup = require("jdtls.setup")

local home = vim.env.HOME

local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"

local workspace_dir = home
  .. "/.local/share/eclipse/"
  .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local config = {
  cmd = {
    mason_path .. "/bin/jdtls",

    "-data",
    workspace_dir,
  },

  root_dir = jdtls_setup.find_root({
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    ".git",
  }),

  capabilities = capabilities,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },

      configuration = {
        updateBuildConfiguration = "interactive",
      },

      maven = {
        downloadSources = true,
      },

      references = {
        includeDecompiledSources = true,
      },

      implementationsCodeLens = {
        enabled = true,
      },

      referencesCodeLens = {
        enabled = true,
      },

      format = {
        enabled = true,
      },

      signatureHelp = {
        enabled = true,
      },
    },
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
