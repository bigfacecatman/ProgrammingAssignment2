##Below are two functions that are used to create a special object that stores matrix and inverses it.
##The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to

    ##set the value of the matrix
    ##get the value of the matrix
    ##set the value of the inversed matrix
    ##get the value of the inversed matrix

makeCacheMatrix<-function(x=matrix()){
	s<-NULL
	set<-function(y){
		x<<-y
		s<<-NULL
	}
	get<-function()x
	setinverse<-function(solve)s<<-solve
	getinverse<-function()s
	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## The second function inverses the matrix created by the first function after it checks the cache for existing inversed matrix. 

cacheSolve<-function(x,...){
	s<-x$getinverse()
	if(!is.null(s)){
		message("getting cached data")
		return(s)
	}
	data<-x$get()
	s<-solve(data,...)
	x$setinverse(s)
	s
        ## Return a matrix that is the inverse of 'x'
}
