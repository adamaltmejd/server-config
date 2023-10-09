# See help(startup) for documentation

# Include data.table repo
options(repos = c(CRAN = "https://cloud.r-project.org",
                  DT = "https://Rdatatable.gitlab.io/data.table"))

options(stringsAsFactors = FALSE)
options(max.print = 200)
options(width = 200)
options(setWidthOnResize = TRUE)

# Don't load TK
options(menu.graphics = FALSE)

# Wider continuation prompt
options(prompt = "> ")
options(continue = "... ")

# Datatable with truncated columns
options(datatable.print.trunc.cols = TRUE)

# Load additional packages at startup
options(defaultPackages = c(getOption("defaultPackages"), "data.table", "targets", "fst"))

# Renv
options(renv.settings.snapshot.type = "implicit")
options(renv.settings.ignored.packages = c("devtools", "roxygen2", "remotes", "colorout", "languageserver"))
options(renv.settings.vcs.ignore.library = TRUE)
options(renv.config.cache.enabled = TRUE)
options(renv.config.cache.symlinks = TRUE)
options(renv.settings.use.cache = TRUE)
options(renv.settings.updates.check = FALSE)

if (interactive()) {
    # # VSCode attach
    if (file.exists(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))) {
        source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))

        # VSCode session watcher settings
        # Watch global environemnt symbols to provide hover on and completion after session symbol.
        # Only specify in .Rprofile since it only takes effect on session startup.
        #options(vsc.globalenv = TRUE)

        # Which view column to show the plot file on graphics update
        # Use FALSE to diable plot watcher so that the default R plot device is used.
        # Only specify in .Rprofile since it only takes effect on session startup.
        #options(vsc.plot = "Beside")

        # The arguments for the png device to replay user graphics to show in VSCode.
        # Ignored if options(vsc.plot = FALSE).
        #options(vsc.dev.args = list(width = 800, height = 600, type = "cairo-png"))

        # Which view column to show the WebView triggered by browser (e.g. shiny apps)?
        # Use FALSE to open in external web browser.
        #options(vsc.browser = "Active" | "Beside" | "Two" | FALSE)

        # Which view column to show the WebView triggered by viewer (e.g. htmlwidgets)?
        # Use FALSE to open in external web browser.
        #options(vsc.viewer = "Two" | "Active" | "Beside" | FALSE)

        # Which view column to show the WebView triggered by page_viewer (e.g. profvis)?
        # Use FALSE to open in external web browser.
        #options(vsc.page_viewer = "Active" | "Beside" | "Two" | FALSE)

        # Which view column to show the WebView triggered by View()?
        # Use FALSE for R's native View(), which should be specified in .Rprofile
        #   since it only takes effect on session startup.
        #options(vsc.view = "Two" | "Active" | "Beside" | FALSE)

        # Which view column to show the WebView triggered by help panel
        # (e.g. after sending `?mean` to terminal)?
        # Use FALSE to disable help panel and revert to old behaviour.
        #options(vsc.helpPanel = "Two" | "Active" | "Beside" | FALSE)

        # How much of the object to show on hover and autocomplete detail?
        # As controlled by max.level arg of str().
        # Use 0 (or 1) is the default - literal value or object type and dimensions
        # Use 2 to show list contents, data frame columns, and example values.
        #options(vsc.str.max.level = 0 | 2 )

        # Show object size in the workspace viewer tooltip
        # The R session could become laggy if there are large character vectors in
        #   objects in the global environment when this option is `TRUE`.
        #options(vsc.show_object_size = FALSE | TRUE)

        # Use the httpgd-based plot viewer.
        # Requires the R package `httpgd` to be installed.
        #options(vsc.use_httpgd = FALSE | TRUE)
    }

    # Update external packages (should work from inside Renv project)
    pkg_update <- function() {
        update.packages(oldPkgs = c("remotes", "devtools", "roxygen2", "testthat",
                                    "renv", "jsonlite", "knitr", "rmarkdown",
                                    "rlang", "lintr", "styler", "R.cache"),
                        lib.loc = "~/.R/packages", ask = FALSE, checkBuilt = TRUE)
        if (!("remotes" %in% installed.packages(lib.loc = "~/.R/packages")[, "Package"])) {
            install.packages("remotes", lib = "~/.R/packages")
        }
        require("remotes", lib.loc = "~/.R/packages")
        remotes::install_github(c("jalvesaq/colorout",
                                "REditorSupport/languageserver",
                                "jimhester/lintr",
                                "r-lib/styler",
                                "nx10/httpgd"),
                                upgrade = "always",
                                lib = "~/.R/packages")

        # Make sure styler has a permanent R.cache path
        require(R.cache, lib.loc = "~/.R/packages")
        R.cache::getCachePath()
    }

    if (!nzchar(Sys.getenv("RADIAN_VERSION"))) {
        # "q()": quit immediately and not save workspace.
        q <- function(save = "no", ...) { quit(save = save, ...) }

        # Enables the colorized output from R (provided by the colorout package) on appropriate consoles.
        # Needs to be downloaded manually from here:
        # https://github.com/jalvesaq/colorout
        if (Sys.getenv("TERM") %in% c("xterm-256color", "screen", "screen-256color")) {
            suppressMessages(require("colorout", lib.loc = "~/.R/packages"))
        }

        # Automatically saves Rhistory even on --no-save.
        invisible(reg.finalizer(
            .GlobalEnv,
            eval(bquote(function(e) try(savehistory(file.path(.(getwd()), ".Rhistory"))))),
            onexit = TRUE
        ))
    }
}

# END (needs newline)
