# go_fuzz_poc
POC Repo for go-fuzz with coverage calculator(?)\
How to run:\
from main directory\
go-fuzz-build -libfuzzer -o parse-complex.a .\
clang -fsanitize=fuzzer parse-complex.a -o parse-complex.libfuzzer\
./parse-complex.libfuzzer /path_to_dir/seed_corpus\
Coverage calculation:\
export FUZZ_CORPUS_DIR=/path_to_dir/seed_corpus/\
go test -coverprofile fuzz.cov -run TestFuzzCorpus\
go tool cover -html=fuzz.cov -o covreport.html
