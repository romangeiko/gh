program square_interp
  a=0.5
  b=1.
  c=(b+a)/2.
  delta=1.d-6
  i=0.
  h=(b-a)/2.
  cond1=abs(b-a)
  cond2=abs(fun(c)/fun(b))
  do while (cond1.gt.delta .and. cond2.ge.delta)
    if ((fun(b)*fun(c)).lt.0) then
      a=c
    else
      b=c
    endif
    h=(b-a)/2.
    c1=c+(h*(fun(a)-fun(b)-(((fun(a)-fun(b))**2)-8*fun(c)*(fun(a)-2*fun(c)+fun(b)))**0.5))/(2*(fun(a)-2*fun(c)+fun(b)))
    c2=c+(h*(fun(a)-fun(b)+(((fun(a)-fun(b))**2)-8*fun(c)*(fun(a)-2*fun(c)+fun(b)))**0.5))/(2*(fun(a)-2*fun(c)+fun(b)))

    if (a.le.c1 .and. c1.le.b) then
      c=c1
    end if

    if (a.le.c2 .and. c2.le.b) then
      c=c2
    end if
    cond1=abs(b-a)
    cond2=abs(fun(c)/fun(b))
    i=i+1
  end do

  write (*,*)  c, i

end program

function fun(x)
  fun=cos(x)-x
  return
end
