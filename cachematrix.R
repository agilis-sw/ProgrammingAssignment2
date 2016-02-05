makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setSolve <- function(solved) s <- solved
    getSolve <- function() s
    list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}

cacheSolve <- function(x, ...) {
    s <- x$getSolve()
    if (isNull(s)) {
        message("Computing and caching solve value")
    	s <- solve(x, ...)
    	x$setSolve(s)
    }
    s
}
