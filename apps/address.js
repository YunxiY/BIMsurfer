/**
 * This class will return the API address for a BIMserver Client
 */

export class Address {
	static getApiAddress() {
		var pathname = document.location.pathname;
		if (pathname.length > 6 && pathname.substring(0, 6) == "/apps/") {
			// We assume that BIMsurfer 3 is being served from a BIMserver and that this is also the BIMserver we would like to connect to
			const href = document.location.href; 
			return href.substring(0, href.indexOf("/apps/"));
		} else {
			// Return a default
			console.log(document.location);
			return "http://localhost:8080";
		}
	}
}