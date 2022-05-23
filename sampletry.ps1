$proc='zsash'
try {
    $kv=get-process -name $proc -ErrorAction Stop -ErrorVariable CurrentError
}
catch {
    write-warning "Bro where is your KV? $proc"
}