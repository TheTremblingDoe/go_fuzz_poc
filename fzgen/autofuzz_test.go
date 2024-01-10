package webpfuzz

// Edit if desired. Code generated by "fzgen golang.org/x/image/webp".

import (
	"io"
	"testing"

	"github.com/thepudds/fzgen/fuzzer"
	"golang.org/x/image/webp"
)

func Fuzz_Decode(f *testing.F) {
	f.Fuzz(func(t *testing.T, data []byte) {
		var r io.Reader
		fz := fuzzer.NewFuzzer(data)
		fz.Fill(&r)

		webp.Decode(r)
	})
}

/*func Fuzz_DecodeConfig(f *testing.F) {
	f.Fuzz(func(t *testing.T, data []byte) {
		var r io.Reader
		fz := fuzzer.NewFuzzer(data)
		fz.Fill(&r)

		webp.DecodeConfig(r)
	})
}*/