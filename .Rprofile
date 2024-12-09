# See help(startup) for documentation
options(repos = c(CRAN = "https://packagemanager.posit.co/cran/latest"))

options(stringsAsFactors = FALSE)
options(menu.graphics = FALSE) # Don't load TK
Sys.setenv(TZ = "Europe/Stockholm")

# Renv
# Project settings
options(renv.settings = list(
    snapshot.type = "implicit",
    ignored.packages = c("devtools", "roxygen2", "remotes", "colorout", "languageserver", "httpgd"),
    use.cache = TRUE,
    vcs.ignore.library = TRUE
))
# User config
options(renv.config = list(
    cache.enabled = TRUE,
    cache.symlinks = TRUE,
    pak.enabled = TRUE,
    updates.check = FALSE,
    #sandbox.enabled = FALSE, # speedup
    #synchronized.check = FALSE, # speedup
    user.environ = TRUE,
    user.profile = TRUE
))

if (interactive()) {
    options(setWidthOnResize = TRUE)
    options(max.print = 200)
    options(width = 200)
    options(prompt = "> ")
    options(continue = "... ") # Wider continuation prompt
    options(datatable.print.trunc.cols = TRUE)

    # VSCode attach
    Sys.setenv(TERM_PROGRAM="vscode")
    options(editor = "code")
    source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))

    # Load default packages
    options(defaultPackages = c(getOption("defaultPackages"), "data.table", "targets"))

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

# Update external packages (should work from inside Renv project)
pkg_update <- function() {
    if (!("pak" %in% installed.packages(lib.loc = "~/.R/packages")[, "Package"])) {
        install.packages("pak", lib = "~/.R/packages")
    }
    require(pak, lib.loc = "~/.R/packages")
    pak_update()
    pkg <- c("devtools",
             "roxygen2",
             "testthat",
             "renv",
             "jsonlite",
             "knitr",
             "rmarkdown",
             "rlang",
             "R.cache",
             "jalvesaq/colorout",
             "REditorSupport/languageserver",
             "jimhester/lintr",
             "r-lib/styler",
             "r-lib/ragg",
             "nx10/httpgd",
             "data.table",
             "targets")
    pkg_install(pkg, upgrade = TRUE, lib = "~/.R/packages")
    data.table::update_dev_pkg()
    # Make sure styler has a permanent R.cache path
    require(R.cache, lib.loc = "~/.R/packages")
    getCachePath()
}

# END (needs newline)
