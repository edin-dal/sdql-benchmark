./check_progs.sh || exit

cd ..
export sdql_benchmark_root=$(pwd)

mkdir -p "timings/$1_results"
echo "*" > "timings/$1_results/.gitignore"

cd "$(realpath progs/)/../generated" || exit
for file in ../progs/job/$1/*.sdql; do
  name=${file##*/}
  no_ext="${name%.*}"
  echo $no_ext
  echo "Running $no_ext"
  ./$no_ext.out | grep --text " ms" > $sdql_benchmark_root/timings/$1_results/$no_ext.result
done
