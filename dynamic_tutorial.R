#https://www.r-bloggers.com/coding-a-dynamic-systems-and-controlling-it-via-a-graphical-user-interface/


Lorenz<-function(t, state, parameters) {
  with(as.list(c(state, parameters)),{
    # rate of change
    dX <- a*X + Y*Z
    dY <- b * (Y-Z)
    dZ <- -X*Y + c*Y - Z
    
    # return the rate of change
    list(c(dX, dY, dZ))
  }
  ) # end with(as.list ...
}

RunModel <- function(h, ...) {
  parameters <- c(a = -8/3, b = as.numeric(svalue(Ber)), c = as.numeric(svalue(Cer)))
  state <- c(X = 1, Y = 1, Z = 1)
  times <- seq(0, svalue(timer), by = 0.001)
  out<-ode(y = state, times = times, func = Lorenz, parms = parameters)
  out<-cbind(out, newX=0, newY=0)
  # assign('out', ode(y = state, times = times, func = Lorenz, parms = parameters), envir=.GlobalEnv)
  
  # pXY<-ggplot(as.data.frame(out))+geom_path(aes(X, Y, col=time))
  # pXZ<-ggplot(as.data.frame(out))+geom_path(aes(X, Z, col=time))
  # pYZ<-ggplot(as.data.frame(out))+geom_path(aes(Y, Z, col=time))
  # multiplot(pXY,pXZ,pYZ, cols=3)
  
  pXY<-ggplot(as.data.frame(out)) +geom_path(aes(X, Y, col=time, alpha=Z)) + opts(legend.position = "none")
  pZY<-ggplot(as.data.frame(out)) +geom_path(aes(Z, Y, col=time, alpha=X)) + opts(legend.position = "none")
  pXZ<-ggplot(as.data.frame(out)) +geom_path(aes(X, Z, col=time, alpha=Y)) + opts(legend.position = c(1.1,0.5))
  p3D<-ggplot(as.data.frame(out)) +theme_invisible() +geom_path(aes(X*Y, X*Z, col=time, alpha=Y*Z)) + scale_alpha(range = c(0.4, 0.8)) + opts(legend.position = 'none')
  windows(width= 10, height= 10)
  multiplot(pXY,pZY,pXZ,p3D, cols=2)
  
  # plot(out)
  # plot3d(out)
  # PlotPars(parameters, times)
}