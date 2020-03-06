# Install packages in user library
.libPaths("~/.R/packages")

# Set width on resize
options(setWidthOnResize = TRUE)

options(stringsAsFactors = FALSE)
options(max.print = 100)

# Don't load TK
options(menu.graphics = FALSE)

# Wider continuation prompt
options(prompt = "> ")
options(continue = "... ")

# Datatable with truncated columns
options(datatable.print.trunc.cols = TRUE)

# "q()": quit immediately and not save workspace.
q <- function(save = "no", ...) { quit(save = save, ...) }

# Enables the colorized output from R (provided by the colorout package)
# on appropriate consoles.
# Needs to be downloaded manually from here:
# https://github.com/jalvesaq/colorout
if (Sys.getenv("TERM") %in% c("xterm-256color", "screen", "screen-256color")) {
    suppressMessages(library("colorout"))
}

# Automatically saves Rhistory even on --no-save.
if (interactive()) {
    invisible(reg.finalizer(
        .GlobalEnv,
        eval(bquote(function(e) try(savehistory(file.path(.(getwd()), ".Rhistory"))))),
        onexit = TRUE
    ))
}
