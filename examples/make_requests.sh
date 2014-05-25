for i in 1 2 3 4 5
do
  for j in 1 2 3 4 5
  do
    curl http://localhost:8080/request/$i/$j&
  done
  sleep 1
done
