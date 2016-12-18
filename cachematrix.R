
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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
