./check_progs.sh || exit

qs=(
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
  19
  20
  21
  22
)

cd "$(realpath ../progs/)/../generated" || exit
for i in "${qs[@]}"
do
  rm -f q$i.cpp
done

cd ..
sbt "run benchmark $1 progs/tpch $(printf 'q%q.sdql ' "${qs[@]}")"
