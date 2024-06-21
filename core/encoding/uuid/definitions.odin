package uuid

// A RFC 4122 Universally Unique Identifier
Identifier :: struct #raw_union {
	integer: u128be,
	bytes:   [16]u8,
}

EXPECTED_LENGTH :: 8 + 4 + 4 + 4 + 12 + 4

VERSION_BYTE_INDEX :: 6
VARIANT_BYTE_INDEX :: 8

Read_Error :: enum {
	None,
	Invalid_Length,
	Invalid_Hexadecimal,
	Invalid_Separator,
}

Variant_Type :: enum {
	Unknown,
	Reserved_Apollo_NCS,    // 0b0xx
	RFC_4122,               // 0b10x
	Reserved_Microsoft_COM, // 0b110
	Reserved_Future,        // 0b111
}

// Name string is a URL.
Namespace_DNS := Identifier {
	bytes = {
		0x6b, 0xa7, 0xb8, 0x10, 0x9d, 0xad, 0x11, 0xd1,
		0x80, 0xb4, 0x00, 0xc0, 0x4f, 0xd4, 0x30, 0xc8,
	},
}

// Name string is a fully-qualified domain name.
Namespace_URL := Identifier {
	bytes = {
		0x6b, 0xa7, 0xb8, 0x11, 0x9d, 0xad, 0x11, 0xd1,
		0x80, 0xb4, 0x00, 0xc0, 0x4f, 0xd4, 0x30, 0xc8,
	},
}

// Name string is an ISO OID.
Namespace_OID := Identifier {
	bytes = {
		0x6b, 0xa7, 0xb8, 0x12, 0x9d, 0xad, 0x11, 0xd1,
		0x80, 0xb4, 0x00, 0xc0, 0x4f, 0xd4, 0x30, 0xc8,
	},
}

// Name string is an X.500 DN (in DER or a text output format).
Namespace_X500 := Identifier {
	bytes = {
		0x6b, 0xa7, 0xb8, 0x14, 0x9d, 0xad, 0x11, 0xd1,
		0x80, 0xb4, 0x00, 0xc0, 0x4f, 0xd4, 0x30, 0xc8,
	},
}
