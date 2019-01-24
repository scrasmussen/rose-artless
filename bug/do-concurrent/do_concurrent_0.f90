program doconcurrent_0
  integer :: i, a
  do concurrent (i=1:4)
     a = -1
  end do
end program doconcurrent_0
