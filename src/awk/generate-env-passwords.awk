# Generates a 24-character alphanumeric password.
function generate_password() {
    cmd = "/usr/bin/env bash -c '</dev/urandom tr -dc \"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\" | head -c24'"
    cmd | getline pw
    close(cmd)
    return pw
}

# Generates a UUID.
function generate_uuid() {
    cmd = "uuidgen"
    cmd | getline uuid
    close(cmd)
    return uuid
}

{
    if ($0 ~ /^[^#].*_(PASSWORD|SECRET)=$/) {
        print $0generate_password()
    }
    else if ($0 ~ /^[^#].*_UUID=$/) {
        print $0generate_uuid()
    }
    else {
        print $0
    }
}
