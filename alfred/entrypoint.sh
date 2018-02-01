sudo -u olad olad --daemon
uwsgi --http-socket 0.0.0.0:5000 -p 4 --manage-script-name --master --no-orphans --mount /=alfred_http.flask.entry_point:app --pyargv alfred_maison.extension.MaisonExtension
