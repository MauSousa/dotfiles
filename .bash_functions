function cre() {
    local dir=$1
    mkdir -p "$dir" && z "$dir"
}
