function replace(line, env_var) {
    env_val_cmd = "echo \"$"env_var"\""
    env_val_cmd | getline env_val
    close(env_val_cmd)

    replace_cmd = "echo '"line"' | sed s/{{ "env_var" }}/"env_val"/"
    print replace_cmd

    #return pw
}

{
    line = $0
    for (env_var in ENVIRON) {
        #print "YAMAN "name" = "ENVIRON[env_var];
        if (line ~ env_var) {
            print line
            print RSTART
            replace(line, env_var)
        }
    }
}
