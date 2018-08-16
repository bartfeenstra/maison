# Generates a 24-character alphanumeric password.
function password(len) {
    cmd = "/usr/bin/env bash -c '</dev/urandom tr -dc \"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\" | head -c"len"'"
    cmd | getline pw
    close(cmd)
    return pw
}

{
    if ($0 ~ /^MAISON_AC_ISSUER_ID_TOKEN_HS256_SECRET=$/) {
        print $0password(32)
    }
    else if ($0 ~ /^[^#].*_(PASSWORD|SECRET)=$/) {
        print $0password(24)
    }
    else {
        print $0
    }
}
