## Pair of functions that cache the inverse of a matrix

##This function creates a special "matrix" object that can cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
	m_inv <- NULL
	set <- function(y) {
		x <<- y
		m_inv <<- NULL
	}
	get <- function () x
	set_matrix_inverse <- function(matrix_inverse) m_inv <<- matrix_inverse
	get_matrix_inverse <- function() m_inv
	list(set = set, get = get, set_matrix_inverse = set_matrix_inverse, get_matrix_inverse = get_matrix_inverse) 
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve
## will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m_inv <- x$get_matrix_inverse()
	if(!is.null(m_inv)) {
		message("getting cached data")
		return(m_inv)
	}
	data <- x$get()
	m_inv <- solve(data,...)
	x$set_matrix_inverse(m_inv)
	m_inv
}
