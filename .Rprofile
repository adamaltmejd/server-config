# See help(startup) for documentation

# Dont ask for mirror
local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org"
       options(repos=r)
})

options(stringsAsFactors = FALSE)
options(max.print = 200)
options(width = 200)
options(setWidthOnResize =
TRUE)

# Don't load TK
options(menu.graphics = FALSE)

# Wider continuation prompt
options(prompt = "> ")
options(continue = "... ")

# Datatable with truncated columns
options(datatable.print.trunc.cols = TRUE)

# Renv
options(renv.settings.snapshot.type = "implicit")
options(renv.settings.ignored.packages = c("devtools", "remotes", "colorout", "languageserver"))
options(renv.settings.vcs.ignore.library = TRUE)
options(renv.config.cache.enabled = TRUE)
options(renv.config.cache.symlinks = TRUE)
options(renv.settings.use.cache = TRUE)
options(renv.settings.updates.check = FALSE)

# VSCode attach
if (file.exists(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))) {
    source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
}

# Update external packages (should work from inside Renv project)
pkg_update <- function() {
    update.packages(oldPkgs = c("remotes", "devtools", "renv", "jsonlite",
                                "rlang", "lintr", "styler", "R.cache"),
                    lib.loc = "~/.R/packages", ask = FALSE, checkBuilt = TRUE)
    if (!("remotes" %in% installed.packages(lib.loc = "~/.R/packages")[,"Package"])) {
        install.packages("remotes", lib = "~/.R/packages")
    }
    require("remotes", lib.loc = "~/.R/packages")
    remotes::install_github(c("jalvesaq/colorout",
                              "REditorSupport/languageserver"),
                            upgrade = "always",
                            lib = "~/.R/packages")

    # Make sure styler has a permanent R.cache path
    require(R.cache, lib.loc = "~/.R/packages")
    R.cache::getCachePath()
}

if (interactive() & !nzchar(Sys.getenv("RADIAN_VERSION"))) {
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
