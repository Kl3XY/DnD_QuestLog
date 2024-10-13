function color(Red, Green, Blue) constructor{
	R = Red;
	G = Green;
	B = Blue;
	
	function convert() {
		return new color(R/255, G/255, B/255)
	}
	
	function toArray() {
		return [R, G, B]	
	}
	
	function sanityCheck() {
		if (R > 255) { R = R - 255};	
		if (R < 0) { R = R + 255};	
		
		if (G > 255) { G = G - 255};	
		if (G < 0) { G = G + 255};	
		
		if (B > 255) { B = B - 255};	
		if (B < 0) { B = B + 255};	
	}
}