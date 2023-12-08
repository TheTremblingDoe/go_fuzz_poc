#!/bin/bash
go install github.com/dvyukov/go-fuzz/go-fuzz-build@latest
go-fuzz-build -libfuzzer -o parse-complex.a .
clang -fsanitize=fuzzer parse-complex.a -o parse-complex.libfuzzer
./parse-complex.libfuzzer /home/izolotnikov/Desktop/test/seed_corpus
export FUZZ_CORPUS_DIR=/home/izolotnikov/Desktop/test/seed_corpus/
go test -coverprofile fuzz.cov -run TestFuzzCorpus
go tool cover -html=fuzz.cov -o covprofile.html
firefox covprofile.html
