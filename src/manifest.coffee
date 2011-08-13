# The last two components of the version number are timestamp-based.
d_t = (new Date / 1000 | 0) - (t_0 = 1313121211)
versionLimit = 1 << 16 - 1
version = "0.0.#{d_t / versionLimit | 0}.#{d_t % versionLimit | 0}"

console.log JSON.stringify
	name: "Stack Enhanced"
	description: "Adds offline support and several other features to sites on the Stack Exchange Q&A network."
	
	version: version
	minimum_chrome_version: "13.0"
	
	permissions: [
    	"*://stackexchange.com/*"
    	"*://*.stackoverflow.com/*"
    	"*://stackoverflow.com/*"
    	"*://*.stackoverflow.com/*"
    	"*://superuser.com/*"
    	"*://*.superuser.com/*"
    	"*://serverfault.com/*"
    	"*://*.serverfault.com/*"
    	
    	"bookmarks"
    	"contextMenus"
    	"history"
    	"idle"
    	"tabs"
    	"unlimitedStorage"
	]
	
	app:
		launch:
			local_path: "main.html"
			container: "tab"
	
	options_page: "options.html"
	
	omnibox:
	    keyword: "-so"
	
	icons:
		16: "res/icon-16.png"
		48: "res/icon-48.png"
		128: "res/icon-128.png"
