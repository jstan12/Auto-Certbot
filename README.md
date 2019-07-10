# Duo Access Gateway Certbot Certificate Renewal
Create and renew certificates for Duo Access Gateway using Let's Encrypt Certbot.
Conf file must be completed before using.
Downloads certificates to machine where script is ran.
Certificates must be manually uploaded to DAG admin web interface.

Uses port 80 on server
Tested on Ubuntu 18.04 LTS

### Configuration (conf)

    # SSH user name
    USER="joe"
    # Public URL of DAG
    DAG_URL="dag.example.org"
    # /Users/localUserName/Downloads/ - Must end with "/"
    DOWNLOAD="/Users/joe/Downloads/"
