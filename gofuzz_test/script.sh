#!/bin/bash
go install github.com/dvyukov/go-fuzz/go-fuzz-build@latest
#Start fuzzing with go-fuzz in libfuzzer mode
go-fuzz-build -libfuzzer -o parse-complex.a .
clang -fsanitize=fuzzer parse-complex.a -o parse-complex.libfuzzer
./parse-complex.libfuzzer /home/i.zolotnikov/gofuzz_test/seed_corpus
#Coverage calculation:
export FUZZ_CORPUS_DIR=/home/i.zolotnikov/gofuzz_test/seed_corpus
go test -coverprofile fuzz.cov -run TestFuzzCorpus
go tool cover -html=fuzz.cov -o covreport.html