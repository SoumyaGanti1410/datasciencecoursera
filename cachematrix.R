## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  ## This function creates a special "matrix" object that can cache its inverse.
 m <- NULL
  set <- function(y) {
          x <<- y
          m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {   ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(m)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(m)
  m
}
