
## The goal of this couple of functions is to create special matrix objects
## that allow their "inverse" to be cached.


## The makeCacheMatrix() function creates a special type of matrix that is
## actually a list of functions that allow to interact with the matrix itself.
## Objects created with this function store in their environments reference
## to the matrix itself and to the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) {
		inv <<- inverse
	}
	getinverse <- function() inv
	list(set = set,
	     get = get,
	     setinverse = setinverse,
	     getinverse = getinverse)
}


## The cacheSolve() function is a cache-friendly version of the solve()
## function. It expects as input an object created with makeCacheMatrix(),
## and returns the output of the solve() function. However, if the
## inverse of the matrix was already calculated and stored in the
## makeCacheMatrix object (cached), it directly retrieves the cached value.

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("getting cached inverse")
		return(inv)
	}
	matrix <- x$get()
	inv <- solve(matrix, ...)
	x$setinverse(inv)
	inv
}
