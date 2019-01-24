program doconcurrent_0
  integer :: i
  do concurrent (i=1:4)
     print *, "i = ", i
  end do

  print *, "Fin"
end program doconcurrent_0
