### Intro
Scripted creation/renewal for Let's Encrypt Certbot. Conf file must be completed before using. Downloads certificates to machine where script is ran. Uses port 80 on server.

Tested on Ubuntu 18.04 LTS

### Configuration Example (conf)

    # SSH user name
    USER="joe"
    # Public URL of server
    SERVER_URL="dag.example.org"
    # /Users/joe/Downloads/ - Must end with "/"
    DOWNLOAD="/Users/joe/Downloads/"
