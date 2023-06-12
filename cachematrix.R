## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.

<!-- -->
    makeCacheMatrix <- function(x = matrix()) {
            inv <- NULL
            set <- function(y) {
                x <<- y
                inv <<- NULL
    }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set,
            get = get,
            setinverse = setinverse,
            getinverse = getinverse
    }

2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

<!-- -->
    
    cacheSolve <- function(x, ...) {
            inv <- x$getinverse()
        if (!is.null(inv)) {
              message("datos almacenados en caché")
              return(inv)
             }
          data <- x$get()
          inv <- solve(data, ...)
          x$setinverse(inv)
            inv
          }
          m <- matrix(c(1,2,3,4),2,2)
          m1 <- makeCacheMatrix(m)
          cacheSolve(m1) #inverse returned 
                    [,1] [,2]
             [1,]   -2  1.5
             [2,]    1 -0.5
   

