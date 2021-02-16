# See help(startup) for documentation

# Dont ask for mirror
local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org"
       options(repos=r)
})

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

# Renv
options(renv.settings.snapshot.type = "implicit")
options(renv.settings.ignored.packages = c("devtools", "remotes", "colorout", "languageserver"))
options(renv.settings.vcs.ignore.library = TRUE)
options(renv.settings.use.cache = TRUE)
options(renv.settings.updates.check = FALSE)

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
