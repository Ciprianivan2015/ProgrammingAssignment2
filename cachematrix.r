#.....................................................................
#
#
#.....................................................................
makeCacheMatrix <- function( mat_x = matrix())
{
    #.......... initialize the inverse of the matrix with NULL .......
    inv_mat <- NULL 
    
    # ...... SET function: definition ................................
    set <- function( mat_y )
    {
      mat_x   <<- mat_y
      inv_mat <<- NULL
    }
    
    # ...... GET function: definition ........................................
    get <- function(  )
    {
      mat_x   
    }
    
    # ...... set_Inverse function: definition ................................
    set_Inverse <- function( the_inverse )
    {
      inv_mat <<- the_inverse
    }
    
    # ...... get_Inverse function: definition ................................
    get_Inverse <- function(  )
    {
      inv_mat  
    }
    
    # ............Put together object attributes and return it as output .....
    list(set = set
          , get = get
          , set_Inverse = set_Inverse
          ,  get_Inverse = get_Inverse 
         )
}

#.....................................................................
#  checks to see if Inverse already computed
#     1. YES => return the result
#     2.  NO => 2.1 compute the Inverse 
#               2.2 return the result
#.....................................................................

cacheSolve <- function(mat_x, ...)
{
  inv_mat <- mat_x$get_Inverse()
  # ....... checks to see if Inverse already computed .................
  if( !is.null( inv_mat ) ){
       message("Inverse already computed.Getting cached data:")
       return(inv_mat)
   }
  data <- mat_x$get()
  
  #......... compute the Inverse .....................................
  inv_mat <- solve(a = data) 
  # ........ assign it to the "mat_x" object .........................
  mat_x$set_Inverse( inv_mat )
  #......... return the inverse ....................................
  message("Return computed inverse:")
  return(inv_mat)
}

#.....................................................................
#
#    HOW I tested my scripts: 
#.....................................................................
#  m_size = NULL
#  m_v = NULL
#  c_v = NULL
#  my_matrix = NULL
#  my_inv_matrix = NULL
# 
#  m_size = 5000
#  m_v = diag( m_size )
#  c_v = 1:m_size
# 
#  m_v = m_v * c_v  ## ...... invertible matrix ........................
# 
#  # .................... assign the object ........
#  my_matrix = makeCacheMatrix(m_v)
#  
#  # .................... Call cacheSolve the 1st time ........
#  system.time( cacheSolve(my_matrix) ) 
#  # .................... Call cacheSolve the 1st time ........
#  system.time( cacheSolve(my_matrix) ) 




