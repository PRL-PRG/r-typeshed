#!/usr/bin/env Rscript
# Write <pkg>/EXPORTS, the names <pkg> exports (one per line, sorted), from
# the installed package, for each package given (all the directories with a
# METADATA by default). The installed version must be the one of METADATA.
# Also lists the signatures of <pkg>/<pkg>.R for names <pkg> does not export.
#
# Usage: Rscript scripts/exports.R [pkg...]   (from the repository's root)

args <- commandArgs(trailingOnly = TRUE)
pkgs <- if (length(args)) args else
  basename(dirname(Sys.glob(file.path("*", "METADATA"))))
status <- 0L
for (pkg in pkgs) {
  meta <- read.dcf(file.path(pkg, "METADATA"))
  want <- meta[1, "Version"]
  have <- tryCatch(as.character(packageVersion(pkg)), error = function(e) NA)
  if (is.na(have)) {
    message(pkg, ": not installed"); status <- 1L; next
  }
  if (have != want) {
    message(pkg, ": installed ", have, ", METADATA says ", want, "; skipped")
    status <- 1L; next
  }
  exports <- sort(getNamespaceExports(pkg))
  writeLines(exports, file.path(pkg, "EXPORTS"))
  message(pkg, " ", have, ": ", length(exports), " exports")
  sigs <- file.path(pkg, paste0(pkg, ".R"))
  if (file.exists(sigs)) {
    m <- regmatches(readLines(sigs), regexec(paste0("^#\\| ", pkg, "::\\(?([^ )]+)\\)? :"), readLines(sigs)))
    declared <- unique(vapply(Filter(length, m), `[`, "", 2L))
    internal <- setdiff(declared, exports)
    if (length(internal))
      message("  signatures of names ", pkg, " does not export: ", paste(internal, collapse = ", "))
  }
}
quit(status = status)
