active proctype TRUE() { 
  if
    :: false -> printf("1\n")
    :: true  -> printf("2\n")
  fi
}

active proctype ELSE() {  
  if
    :: false -> printf("1\n")
    :: else  -> printf("2\n")
  fi
}