
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh

	# Automated changing of virtualenv when entering directories.
	# Written byJustin Lilly,
	# https://github.com/justinlilly/jlilly-bashy-dotfiles/commit/04899f005397499e89da6d562b062545e70d7975
	has_virtualenv() {
	    if [ -e .venv ]; then
			workon `cat .venv`
	    fi
	}

	venv_cd () {
	    cd "$@" && has_virtualenv
	}
	alias cd="venv_cd"
fi


# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@"
	}
fi

# Create a data URL from an image (works for other file types too, if you tweak the Content-Type afterwards)
dataurl() {
	echo "data:image/${1##*.};base64,$(openssl base64 -in "$1")" | tr -d '\n'
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python3 -c $'from http import server;\nmap = server.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\n\tserver.test();' "$port"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
	encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Gzip-enabled `curl`
function gurl() {
	curl -sH "Accept-Encoding: gzip" "$@" | gunzip
}

# Syntax-highlight JSON strings or files
function json() {
	if [ -p /dev/stdin ]; then
		# piping, e.g. `echo '{"foo":42}' | json`
		python3 -mjson.tool | pygmentize -l javascript
	else
		# e.g. `json '{"foo":42}'`
		python3 -mjson.tool <<< "$*" | pygmentize -l javascript
	fi
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	echo # newline
}

