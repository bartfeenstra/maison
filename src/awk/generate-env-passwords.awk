# Generates an alphanumeric password.
function generate_password(len) {
    cmd = "/usr/bin/env bash -c '</dev/urandom tr -dc \"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\" | head -c"len"'"
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
    if ($0 ~ /^MAISON_OAUTH2_COOKIE_SECRET=$/) {
        cmd = "echo -n "generate_password(32)" | base64"
        cmd | getline secret
        close(cmd)
        print $0secret
    }
    else if ($0 ~ /^[^#].*_(PASSWORD|SECRET)=$/) {
        print $0generate_password(24)
    }
    else if ($0 ~ /^[^#].*_UUID=$/) {
        print $0generate_uuid()
    }
    else {
        print $0
    }
}
