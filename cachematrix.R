## Put comments here that give an overall description of what your
## functions do

## Two functions defined in this file are used to compute the inverse of a given matrix
## With the capability of caching the inverse matrix
## Usage: cacheSolve(makeCacheMatrix(x)) where x is the matrix to be inverted.


## Write a short comment describing this function

## The function makeCacheMatrix is used to cache a matrix and its inverse into environments.
## The inverse is stored in the environment within the definitin of the makeCacheMatrix function.
## The matrix to be inverted can be stored in any environment but at default, it is stored
## in the environment within the definition of the makeCacheMatrix function

## Input argument: The matrix to be inverted
## Return: A list with methods to get and set the matrix to be inverted and methods to get and set
##         inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  get <- function() x
  setInverseMatrix <- function(inverseMatrix) im <<- inverseMatrix
  getInverseMatrix <- function() im
  list(set = set, get = get, setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function

## The function cacheSolve is used to retrieve the cached inverse matrix if available.
## If the cached inverse is not available, the cached matrix is converted to its inverse
## and the inverse is cached in the environment in the definition of makeCacheMatrix

## Input argument: The first argument is the return of makeCacheMatrix
## Return: The inverted matrix


cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
  im <- x$getInverseMatrix()
  if (!is.null(im)) {
    message("getting cached data")
    return (im)
  }
  data <- x$get()
  im <- solve(data)
  x$setInverseMatrix(im)
  im
}
