local M = {}

local root_markers = {
  ".git",
  -- ant
  "build.xml",
  -- maven
  "mvnw",
  "pom.xml",
  -- gradle
  "gradlew",
  "settings.gradle",
  "settings.gradle.kts",
  -- gradle multi-module project
  "build.gradle",
  "build.gradle.kts",
}

local jdtls_data = vim.fn.stdpath("data") .. '/nvim-jdtls'
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local project_data_dir = jdtls_data .. "/" .. project
os.execute("mkdir " .. project_data_dir)

local runtimes = function ()
  local runtimes = {}

  local devbox_global = vim.fn.system("devbox global path")
  local global_pkgs_dir = devbox_global .. "/.devbox/nix/profile/default"

  local name = vim.fn.system(global_pkgs_dir .. "/bin/java -version 2>&1 >/dev/null")
  local version = vim.re.match(name, "s <- {%d+} / . s")

  table.insert(runtimes, {
    {
      name = "JavaSE-" .. version,
      path = global_pkgs_dir .. "/bin/java"
    }
  })

  return runtimes
end
runtimes()

M.config = function ()
  local jdtls = require("jdtls")
  local jdtls_setup = require("jdtls.setup")
  return {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
      "-configuration",
      vim.fn.expand "$MASON/share/jdtls/config",
      "-data",
      project_data_dir,
    },
    root_dir = jdtls_setup.find_root(root_markers),
    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = {
          updateBuildConfiguration = "interactive",
          runtimes = runtimes()
        },
        maven = { downloadSources = true },

        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true },
      },
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      contentProvider = { preferred = "fernflower" },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      }
    }
  }
end

return M
