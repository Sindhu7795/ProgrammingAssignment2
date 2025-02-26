## Put comments here that give an overall description of what your
## functions do

## Created mean using makeCacheMatrix
makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Created inverse using cacheSolve
cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if (!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
        ## Return a matrix that is the inverse of 'x'
}


# Create a matrix
m <- matrix(c(1,2,3,4), nrow=2, ncol=2)
# Create a cached matrix object
cached_m <- makeCacheMatrix(m)
 
# Calculate the inverse (this will compute and cache it)
cacheSolve(cached_m)
 
# Calculate the inverse again (this will retrieve from cache)
cacheSolve(cached_m)
