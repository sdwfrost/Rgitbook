#' Check if Gitbook is installed.
#' 
#' If Gitbook is not installed it will try to do so. If the installion fails or
#' Node.js is not installed, an error will be thrown.
#' 
#' @param quiet logical indicating whether messages should be printed.
#' @export
checkForGitbook <- function(quiet=FALSE) {
	if(!quiet) cat("checking npm\n")
	if(system('npm version', ignore.stdout=TRUE)) {
		stop("Cannot find node.js. You can install it from http://nodejs.org/download/")
	}
	if(!quiet) cat("checking gitbook\n")
	if(system('gitbook --version', ignore.stdout=TRUE)) {
		if(!quiet) { message("Installing gitbook...") }
		installGitbook()
	}
	if(!quiet) { message('gitbook is installed and available')}
	invisible(TRUE)
}
