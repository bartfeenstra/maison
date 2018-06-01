# Generates a 24-character alphanumeric password.
function password() {
    cmd = "/usr/bin/env bash -c '</dev/urandom tr -dc \"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\" | head -c24'"
    cmd | getline pw
    close(cmd)
    return pw
}

{
    if ($0 ~ /^[^#].*_(PASSWORD|SECRET)=$/) {
        print $0password()
    }
    else {
        print $0
    }
}
