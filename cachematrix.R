## This pair of functions will cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    ## Initialize the inverse property
    i <- NULL
    
    ## Method to set the matrix
    set <- function(matrix) {
        m <<- matrix
        i <<- NULL
    }
    
    ## Method the get the matrix
    get <- function() {
        ## Return the matrix
        m
    }
    
    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }
    
    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }
    
    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function computes inverse of special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- getInverse(x)
    ## Simply return the inverse if its already set
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    ## Get the matrix from our object
    ## Calculate the inverse using matrix multiplication
    ## Set the inverse to the object
    ## Return the matrix
    data <- x$get()
    m <- solve(data) %*% data
    x$setInverse(m)
    m
}