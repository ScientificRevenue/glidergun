
module-load() {
	declare filename="$1"
	source "$filename"
	if grep '^init()' "$filename" > /dev/null; then
		init
	fi
}

module-load-dir() {
	declare dir="$1"
	shopt -s nullglob
	for path in $dir/*.bash; do
		module-load "$path"
	done
	shopt -u nullglob
}
