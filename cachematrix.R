## Assignment: Caching the Inverse of a Matrix
## makeCacheMatrix: This function creates a special "matrix" object 
##                  that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" 
##             returned by makeCacheMatrix

## function to create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get, 
         setinverse = setinverse,
         getinverse = getinverse)
}

##  function to compute the inverse of the special "matrix"

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
