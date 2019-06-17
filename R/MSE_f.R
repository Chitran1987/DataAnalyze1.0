MSE_f<-function(func, op_v, dat){
  try(if(class(func)!='function'){stop('argument to MSE_f(f) has to be a function')}
      else{
        m<-(sum((func(op_v)-dat[1,])^2))
        return(m)
      })
}
