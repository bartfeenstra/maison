({
    "Name": .Config.Labels["com.docker.compose.service"],
    "Tags": (if .Config.Labels | has("maison.service.tags") then (.Config.Labels["maison.service.tags"] | split(",")) else [] end),
    "Address": (.NetworkSettings.Networks.maison_maison.IPAddress // env.MAISON_LOCAL_IP)
}
+
(
if .Config.Labels | has("maison.service.port") then
{
    "Port": .Config.Labels["maison.service.port"],
    "Check": ({
        "Interval": "2s"
    }
    +
    (
    if (.Config.Labels | has("maison.service.tags")) and (.Config.Labels["maison.service.tags"] | split(",") | contains(["maison-web"])) then
    {
        "HTTP": ("http://" + .NetworkSettings.Networks.maison_maison.IPAddress + ":" + .Config.Labels["maison.service.port"]),
        "TLSSkipVerify": true,
    }
    else
    {
        "TCP": (.NetworkSettings.Networks.maison_maison.IPAddress + ":" + .Config.Labels["maison.service.port"]),
    }
    end
    ))
}
else
{}
end
))
