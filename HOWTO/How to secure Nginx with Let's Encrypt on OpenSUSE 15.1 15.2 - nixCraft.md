Let’s Encrypt is a free, automated, and open certificate authority for your website, email server, database server and more. This page shows how to use Let’s Encrypt to install TLS certificate for Nginx web server and get SSL labs/security headers A+ score on an OpenSUSE Linux version 15.1/15.2.

How to secure Nginx with Let’s Encrypt on OpenSUSE Linux
--------------------------------------------------------

The procedure is as follows to obtaining an SSL/TLS certificate:

1. Get acme.sh client, run:
**git clone https://github.com/Neilpang/acme.sh.git**
2. Create nginx config for your domain:
**vi /etc/nginx/vhosts.d/your-domain-name.conf**
3. Obtain an SSL certificate your domain:
**acme.sh –issue -d your-domain-name –nginx**
4. Configure TLS on Nginx:
**vi /etc/nginx/conf.d/your-domain-name.conf**
5. Setup cron job for auto renewal TLS certificates
6. Open port 443 (HTTPS) using firewalld :
**sudo firewall-cmd –add-service=https**

Let us see all steps in details.

### Step 1 – Install the required software (prerequisites)

Open the terminal and then type the following commands. Make sure you [update OpenSUSE Linux software and kernel using CLI](https://www.cyberciti.biz/faq/update-opensuse-linux-software-kernel-command/) as follows:

```
$ sudo zypper ref
$ sudo zypper up
```

 Our acme.sh client need curl, wc and other packages. Hence, we must install required software using the zypper command:
`$ sudo zypper install wget curl bc git socat cronie`

#### [Install Nginx on an OpenSUSE Linux](https://www.cyberciti.biz/faq/install-and-use-nginx-on-opensuse-linux/)

Again use the zypper:

```
$ sudo zypper install nginx
$ sudo systemctl enable nginx.service
```

    Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.

Start the Nginx server and verify it using the systemctl command:

```
$ sudo systemctl start nginx.service
$ sudo systemctl status nginx.service
```

    ● nginx.service - The nginx HTTP and reverse proxy server
       Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
       Active: active (running) since Mon 2020-07-06 18:49:32 UTC; 2min 4s ago
     Main PID: 13990 (nginx)
        Tasks: 2
       CGroup: /system.slice/nginx.service
               ├─13990 nginx: master process /usr/sbin/nginx -g daemon off;
               └─13991 nginx: worker process

    Jul 06 18:49:32 opensuse-nixcraft-42 systemd[1]: Starting The nginx HTTP and reverse proxy server...
    Jul 06 18:49:32 opensuse-nixcraft-42 nginx[13989]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    Jul 06 18:49:32 opensuse-nixcraft-42 nginx[13989]: nginx: configuration file /etc/nginx/nginx.conf test is successful
    Jul 06 18:49:32 opensuse-nixcraft-42 systemd[1]: Started The nginx HTTP and reverse proxy server.

Finally open HTTP port 80 using [firewllad on OpenSUSE Linux](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/)

```
$ sudo firewall-cmd --zone=public --add-service=http
$ sudo firewall-cmd --zone=public --add-service=http --permanent
$ sudo firewall-cmd --list-services
```

    ssh dhcpv6-client http

### Step 2 – Installing acme.sh Let’s Encrypt client

We must clone the [acme.sh](https://github.com/acmesh-official/acme.sh) repo:

```
$ cd /tmp/
$ git clone https://github.com/Neilpang/acme.sh.git
```

 Install the client but first log in as root user using the su command/sudo command:

```
$ sudo -i
# touch /root/.bashrc
# cd /tmp/acme.sh/
# acme.sh --install --accountemail your-email-id@domain-here
```

![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQwNiIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)

### Step 3 – Basic Nginx configuration for http server on OpenSUSE

I am going to create a new config for domain named opensuse.cyberciti.biz (feel free to replace opensuse.cyberciti.biz with your actual domain name) as follows:
`# vi /etc/nginx/vhosts.d/opensuse.cyberciti.biz.conf`
 Append the following directives:

    # http port 80 config
    server {
        listen      80 default_server; # IPv4
        listen [::]:80 default_server; # IPv6
        server_name opensuse.cyberciti.biz; # domain name 
        access_log  /var/log/nginx/http_opensuse.cyberciti.biz_access.log;
        error_log   /var/log/nginx/http_opensuse.cyberciti.biz_error.log;
        root        /srv/www/htdocs;
    }

Save and close the file. Test nginx set up and [reload the nginx server](https://www.cyberciti.biz/faq/nginx-linux-restart/) as follows:
`# nginx -t && systemctl restart nginx.service`

### Step 4 – Create dhparam.pem file

We need to create a Diffie-Hellman key exchange file as follows using the openssl command:

```
# mkdir -pv /etc/nginx/ssl/cyberciti.biz/
# cd /etc/nginx/ssl/cyberciti.biz/
# openssl dhparam -out dhparams.pem -dsaparam 4096
# ls -l
```

![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMxNCIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)

### Step 5 – Obtain a certificate for domain

We can issue a certificate using the Nginx server as [configured in step 3](https://www.cyberciti.biz/faq/how-to-secure-nginx-with-lets-encrypt-on-opensuse-15-1-15-2/#Nginx_configuration). However, if your server is behind reverse proxy CDN such as Cloudflare, use the standalone mode as described below.

#### Issue a certificate using pre-configured Nginx

```
# DOM="opensuse.cyberciti.biz"
# D="/srv/www/htdocs"
# mkdir -pv ${D}/.well-known/acme-challenge/
# acme.sh --webroot "${D}" --issue -d "$DOM" --ocsp-must-staple --keylength 4096
## GET ecc cert too. Only ec-384 or ec-256 ##
# acme.sh --webroot "${D}" --issue -d "$DOM" --ocsp-must-staple --keylength ec-384
```

![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0MSIgd2lkdGg9IjU5OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)

#### Issue a certificate in standalone mode

```
# DOM="opnesuse.cyberciti.biz"
# acme.sh --issue --standalone -d "$DOM" --ocsp-must-staple --keylength 4096
## GET ecc cert too. Only ec-384 or ec-256 ##
# acme.sh --issue --standalone -d "$DOM" --ocsp-must-staple --keylength ec-384
```

 Where,

* **--webroot /srv/www/htdocs** : Specifies the web root folder for web root mode. You must create /.well-known/acme-challenge/ in the root.
* **--issue** : Issue a certificate.
* **-d domain-name** : Specifies a domain, used to issue, renew or revoke. We can use it multiple times. For example: acme.sh --issue -d www.cyberciti.biz -d ftp.cybercit.biz --ocsp-must-staple --keylength 4096
* **--ocsp-must-staple** : Generate [ocsp must Staple extension](https://en.wikipedia.org/wiki/OCSP_stapling)
* **--keylength 4096** : Specifies the domain key length: 2048, 3072, 4096, 8192 or ec-256, ec-384, ec-521.
* **--keylength ec-256** : [Elliptic-curve cryptography (ECC) ](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography)is an approach to public-key cryptography based on the algebraic structure of elliptic curves over finite fields. ECC allows smaller keys compared to non-EC cryptography (based on plain Galois fields) to provide equivalent security.

### Step 6 – Configure Nginx on an OpenSUSE Linux server

Edit the config file:
`# vi /etc/nginx/vhosts.d/opensuse.cyberciti.biz.conf`
 Update as follows:

    # http port 80 config
    server {
        listen      80 default_server; # IPv4
        listen [::]:80 default_server; # IPv6
        server_name opensuse.cyberciti.biz;
        access_log  off;
        error_log   off;
        root        /srv/www/htdocs;
        return 301 https://$host$request_uri;
    }
    # https port 443 config
    server {
        listen 443 ssl http2;                # IPv4
        listen [::]:443 ssl http2;           # HTTP/2 TLS IPv6
        server_name opensuse.cyberciti.biz;  # domain name 

        # Set document root 
        location / {
                root   /srv/www/htdocs;
                index  index.html index.htm;
        }
        # Set access and error log for this vhos
        access_log /var/log/nginx/https.opensuse.cyberciti.biz_access.log;
        error_log  /var/log/nginx/https.opensuse.cyberciti.biz_error.log;

        # TLS/SSL CONFIG 
        ssl_certificate /etc/nginx/ssl/cyberciti.biz/opensuse.cyberciti.biz.fullchain.cer;
        ssl_certificate_key /etc/nginx/ssl/cyberciti.biz/opensuse.cyberciti.biz.key;
        # ECC certificates 
        ssl_certificate /etc/nginx/ssl/cyberciti.biz/opensuse.cyberciti.biz.fullchain.cer.ecc;
        ssl_certificate_key /etc/nginx/ssl/cyberciti.biz/opensuse.cyberciti.biz.key.ecc;
        ssl_dhparam  /etc/nginx/ssl/cyberciti.biz/dhparams.pem;
        # A little bit of optimization  
        ssl_session_timeout 1d;
        ssl_session_cache shared:NixCraftSSL:10m;  # about 40000 sessions
        ssl_session_tickets off;

        # TLS version 1.2 and 1.3 only
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
        ssl_prefer_server_ciphers off;

        # HSTS (ngx_http_headers_module is required) (63072000 seconds)
        add_header Strict-Transport-Security "max-age=63072000" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-Xss-Protection "1; mode=block" always;
        add_header Referrer-Policy  strict-origin-when-cross-origin always;
        add_header Feature-policy "accelerometer 'none'; camera 'none'; geolocation 'none'; gyroscope 'none'; magnetometer 'none'; microphone 'none'; payment 'none'; usb 'none'" always;
        # WARNING: The HTTP Content-Security-Policy response header allows sysadmin/developers  
        # to control resources the user agent is allowed to load for a given page. 
        # Wrong config can create problems for third party scripts/ad networks. Hence read the following url: 
        # https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
        add_header content-security-policy "default-src https://opensuse.cyberciti.biz:443" always;

        # OCSP stapling
        ssl_stapling on;
        ssl_stapling_verify on;

        # Verify chain of trust of OCSP response using Root CA and Intermediate certs
        ssl_trusted_certificate /etc/nginx/ssl/cyberciti.biz/opensuse.cyberciti.biz.fullchain.cer;

        # Replace with the IP address of your resolver
        resolver 1.1.1.1;
    }

#### Sample index.html

Create a new file as follows:
`# vi /srv/www/htdocs/index.html`
 Append the following code:

    <!doctype html>
    <html lang="en">
    <head>
    <title>OpenSUSE.Cyberciti.Biz Nginx server</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <article>
    <h2>Hello, World!</h2>
    <p>This is a test server powerd by OpenSUSE Linux 15.2 and Nginx with free TLS certficate.</p>
    <hr>
    <small>
    Email us <a href="mailto:webmaster@cyberciti.biz">webmaster@cyberciti.biz</a>.
    </small>
    </body>
    </html>

### Step 7 – Installing Let’s Encrypt TLS certificate on OpenSUSE 15.1/15.2

Install the issued cert to nginx server and reload the server:

```
# DOM="opensuse.cyberciti.biz"
# acme.sh -d "$DOM" \
--install-cert \
--reloadcmd "systemctl reload nginx" \
--fullchain-file "/etc/nginx/ssl/cyberciti.biz/$DOM.fullchain.cer" \
--key-file "/etc/nginx/ssl/cyberciti.biz/$DOM.key" \
--cert-file "/etc/nginx/ssl/cyberciti.biz/$DOM.cer"
```

 Install the ECC certificate too:

```
# acme.sh -d "$DOM" \
--ecc \
--install-cert \
--reloadcmd "systemctl reload nginx" \
--fullchain-file "/etc/nginx/ssl/cyberciti.biz/$DOM.fullchain.cer.ecc" \
--key-file "/etc/nginx/ssl/cyberciti.biz/$DOM.key.ecc" \
--cert-file "/etc/nginx/ssl/cyberciti.biz/$DOM.cer.ecc"
```

![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0MCIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)

### Step 8 – Open TCP port 443 [HTTPS port]

It time to open HTTPS TCP port 443 using [firewllad on OpenSUSE Linux](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/) as follows:

```
# firewall-cmd --zone=public --add-service=https
# firewall-cmd --zone=public --add-service=https --permanent
# firewall-cmd --list-services
# curl -I https://opensuse.cyberciti.biz/
```

### Step 9 – Test it

[SSL labs](https://www.ssllabs.com/ssltest/analyze.html?d=opensuse.cyberciti.biz) test:
![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ1MCIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)
[Security headers](https://securityheaders.com/?q=opensuse.cyberciti.biz&followRedirects=on) test:
![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY0MSIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)
 Fire a web browser and type your domain such as:
`https://opensuse.cyberciti.biz`
![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMSIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)

### Step 10 – Essential acme.sh commands

We can list all certificates, run:
`# acme.sh --list`

    Main_Domain             KeyLength  SAN_Domains  Created                       Renew
    opensuse.cyberciti.biz  "4096"     no           Mon Jul  6 19:07:07 UTC 2020  Fri Sep  4 19:07:07 UTC 2020
    opensuse.cyberciti.biz  "ec-384"   no           Mon Jul  6 19:11:54 UTC 2020  Fri Sep  4 19:11:54 UTC 2020

Renew a cert for domain named opensuse.cyberciti.biz

```
# acme.sh --renew -d opensuse.cyberciti.biz
# acme.sh --force --renew -d opensuse.cyberciti.biz -d www.cyberciti.biz
```

 Please note that a cron job will try to do renewal a certificate for you too. This is installed by default as follows (no action required on your part). To see [cron job](https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/) run:
`# crontab -l`

    28 0 * * * "/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" > /dev/null

Want to upgrade acme.sh client, execute:
`# acme.sh --upgrade`
 Getting help is easy:
`# acme.sh --help | more`

Conclusion
----------

We explain how to install and set up Let’s Encrypt TLS/SSL certificate on your OpenSUSE Linux 15.1/15.2 nginx based server with OCSP Stapling and ECC certificates. See [acme.sh project home page here](https://github.com/acmesh-official/acme.sh) for more information.

This entry is **2** of **3** in the **OpenSUSE Linux LEMP Stack Tutorial** series. Keep reading the rest of the series:

1. [Install and use Nginx on OpenSUSE Linux](https://www.cyberciti.biz/faq/install-and-use-nginx-on-opensuse-linux/)
2. Secure Nginx with Let's Encrypt on OpenSUSE Linux
3. [ Install PHP on OpenSUSE Linux 15.2/15.1](https://www.cyberciti.biz/faq/how-to-install-php-on-opensuse-15-2-15-1/)

This entry is **9** of **13** in the **Secure Web Server with Let's Encrypt Tutorial** series. Keep reading the rest of the series:

1. [Set up Lets Encrypt on Debian/Ubuntu Linux](https://www.cyberciti.biz/faq/how-to-configure-nginx-with-free-lets-encrypt-ssl-certificate-on-debian-or-ubuntu-linux/)
2. [Secure **Lighttpd** with Lets Encrypt certificate on Debian/Ubuntu](https://www.cyberciti.biz/faq/how-to-configure-lighttpd-web-server-with-free-lets-encrypt-ssl-certificate-on-debian-or-ubuntu-linux/)
3. [Configure **Nginx** with Lets Encrypt certificate on **Alpine** Linux](https://www.cyberciti.biz/faq/how-to-install-letsencrypt-free-ssltls-for-nginx-certificate-on-alpine-linux/)
4. [**Nginx** with Lets Encrypt on **CentOS 7**](https://www.cyberciti.biz/faq/how-to-secure-nginx-lets-encrypt-on-centos-7/)
5. [**Apache** with Lets Encrypt Certificates on **RHEL 8**](https://www.cyberciti.biz/faq/how-to-secure-apache-with-lets-encrypt-certificates-on-rhel-8/)
6. [**CentOS 8** and **Apache** with Lets Encrypt Certificates](https://www.cyberciti.biz/faq/apache-with-lets-encrypt-certificates-on-centos-8/)
7. [Install Lets Encrypt certificates on **CentOS 8** for **Nginx**](https://www.cyberciti.biz/faq/configure-nginx-with-lets-encrypt-on-centos-8/)
8. [Forcefully renew Let's Encrypt certificate](https://www.cyberciti.biz/faq/how-to-forcefully-renew-lets-encrypt-certificate/)
9. **OpenSUSE Linux** and Nginx with Let's Encrypt Certificates
10. [Configure Nginx to use TLS 1.2 / 1.3 only](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
11. [Let's Encrypt **wildcard certificate** with acme.sh and **Cloudflare DNS**](https://www.cyberciti.biz/faq/issue-lets-encrypt-wildcard-certificate-with-acme-sh-and-cloudflare-dns/)
12. [Nginx with Let's Encrypt on Ubuntu 18.04 with DNS Validation](https://www.cyberciti.biz/faq/secure-nginx-with-lets-encrypt-on-ubuntu-18-04-with-dns-validation/)
13. [AWS **Route 53** Let's Encrypt wildcard certificate with acme.sh](https://www.cyberciti.biz/faq/route-53-lets-encrypt-wildcard-certificate-with-acme-sh/)

 🐧 Get the latest tutorials on Linux, Open Source & DevOps via **[RSS feed](https://www.cyberciti.biz/atom/atom.xml)** or **[Weekly email newsletter.](https://newsletter.cyberciti.biz/subscription?f=1ojtmiv8892KQzyMsTF4YPr1pPSAhX2rq7Qfe5DiHMgXwKo892di4MTWyOdd976343rcNR6LhdG1f7k9H8929kMNMdWu3g)**

 🐧 1 comment so far... [add one](https://www.cyberciti.biz/faq/how-to-secure-nginx-with-lets-encrypt-on-opensuse-15-1-15-2/#respond) **↓**

CategoryList of Unix and Linux commandsDisk space analyzers[df](https://www.cyberciti.biz/faq/df-command-examples-in-linux-unix/) • [ncdu](https://www.cyberciti.biz/open-source/install-ncdu-on-linux-unix-ncurses-disk-usage/) • [pydf](https://www.cyberciti.biz/tips/unix-linux-bsd-pydf-command-in-colours.html)File Management[cat](https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/) • [cp](https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/) • [mkdir](https://www.cyberciti.biz/faq/linux-make-directory-command/) • [tree](https://www.cyberciti.biz/faq/linux-show-directory-structure-command-line/)Firewall[Alpine Awall](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-awall-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/) • [OpenSUSE](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/) • [RHEL 8 ](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) • [Ubuntu 16.04](https://www.cyberciti.biz/faq/howto-configure-setup-firewall-with-ufw-on-ubuntu-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/how-to-setup-a-ufw-firewall-on-ubuntu-18-04-lts-server/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/)Network Utilities[NetHogs](https://www.cyberciti.biz/faq/linux-find-out-what-process-is-using-bandwidth/) • [dig](https://www.cyberciti.biz/faq/linux-unix-dig-command-examples-usage-syntax/) • [host](https://www.cyberciti.biz/faq/linux-unix-host-command-examples-usage-syntax/) • [ip](https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/) • [nmap](https://www.cyberciti.biz/security/nmap-command-examples-tutorials/)OpenVPN[CentOS 7](https://www.cyberciti.biz/faq/centos-7-0-set-up-openvpn-server-in-5-minutes/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-openvpn-server-in-5-minutes/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-openvpn-server-in-5-minutes/) • [Debian 8/9](https://www.cyberciti.biz/faq/install-configure-openvpn-server-on-debian-9-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/ubuntu-18-04-lts-set-up-openvpn-server-in-5-minutes/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-lts-set-up-openvpn-server-in-5-minutes/)Package Manager[apk](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/) • [apt](https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/)Processes Management[bg](https://www.cyberciti.biz/faq/unix-linux-bg-command-examples-usage-syntax/) • [chroot](https://www.cyberciti.biz/faq/unix-linux-chroot-command-examples-usage-syntax/) • [cron](https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/) • [disown](https://www.cyberciti.biz/faq/unix-linux-disown-command-examples-usage-syntax/) • [fg](https://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/) • [jobs](https://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/) • [killall](https://www.cyberciti.biz/faq/unix-linux-killall-command-examples-usage-syntax/) • [kill](https://www.cyberciti.biz/faq/unix-kill-command-examples/) • [pidof](https://www.cyberciti.biz/faq/linux-pidof-command-examples-find-pid-of-program/) • [pstree](https://www.cyberciti.biz/faq/unix-linux-pstree-command-examples-shows-running-processestree/) • [pwdx](https://www.cyberciti.biz/faq/unix-linux-pwdx-command-examples-usage-syntax/) • [time](https://www.cyberciti.biz/faq/unix-linux-time-command-examples-usage-syntax/)Searching[grep](https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/) • [whereis](https://www.cyberciti.biz/faq/unix-linux-whereis-command-examples-to-locate-binary/) • [which](https://www.cyberciti.biz/faq/unix-linux-which-command-examples-syntax-to-locate-programs/)User Information[groups](https://www.cyberciti.biz/faq/unix-linux-groups-command-examples-syntax-usage/) • [id](https://www.cyberciti.biz/faq/unix-linux-id-command-examples-usage-syntax/) • [lastcomm](https://www.cyberciti.biz/faq/linux-unix-lastcomm-command-examples-usage-syntax/) • [last](https://www.cyberciti.biz/faq/linux-unix-last-command-examples/) • [lid/libuser-lid](https://www.cyberciti.biz/faq/linux-lid-command-examples-syntax-usage/) • [logname](https://www.cyberciti.biz/faq/unix-linux-logname-command-examples-syntax-usage/) • [members](https://www.cyberciti.biz/faq/linux-members-command-examples-usage-syntax/) • [users](https://www.cyberciti.biz/faq/unix-linux-users-command-examples-syntax-usage/) • [whoami](https://www.cyberciti.biz/faq/unix-linux-whoami-command-examples-syntax-usage/) • [who](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/) • [w](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/)WireGuard VPN[Alpine](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-vpn-server-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-wireguard-vpn-server/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-wireguard-vpn-server/) • [Firewall](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-firewall-rules-in-linux/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-set-up-wireguard-vpn-server/)