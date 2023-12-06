package parser

func ParseComplex(data [] byte) bool {
	if len(data) == 6 {
		if data[0] == 'F' && data[1] == 'U' && data[2] == 'Z' && data[3] == 'Z' && data[4] == 'I' && data[5] == 'N' && data[6] == 'G' {
			return true
		}
	}
	return false
}