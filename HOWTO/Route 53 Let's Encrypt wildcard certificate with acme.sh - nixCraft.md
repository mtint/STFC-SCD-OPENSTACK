# Port 80 config
    server {
     listen      80 default_server; # IPv4
     listen [::]:80 default_server; # IPv6
     server_name www.nixcraft.com;
     access_log  off;
     error_log   off;
     root        /var/www/html;
     return 301 https://$host$request_uri;
    }

    # Port 443 config
    server {
     listen 443 ssl http2;                # IPv4
     listen [::]:443 ssl http2;           # HTTP/2 TLS IPv6
     server_name www.nixcraft.com;  # domain name 
     root   /var/www/html;
     index  index.html;

     # Set access and error log for this vhos
     access_log /var/log/nginx/www.nixcraft.com_access.log;
     error_log  /var/log/nginx/www.nixcraft.com_error.log;  
     # TLS/SSL CONFIG 
     ssl_certificate /etc/nginx/ssl/letsencrypt/www.nixcraft.com/www.nixcraft.com.fullchain.cer;
     ssl_certificate_key /etc/nginx/ssl/letsencrypt/www.nixcraft.com/www.nixcraft.com.key;

     # ECC/ECDSA certificates (dual config)
     #ssl_certificate /etc/nginx/ssl/letsencrypt/www.nixcraft.com/www.nixcraft.com.fullchain.cer.ecc;
     #ssl_certificate_key /etc/nginx/ssl/letsencrypt/www.nixcraft.com/www.nixcraft.com.key.ecc;
     ssl_dhparam  /etc/nginx/ssl/letsencrypt/www.nixcraft.com/dhparams.pem;

     # A little bit of optimization 
     ssl_session_timeout 1d;
     ssl_session_cache shared:NixCraftSSL:10m;

     # TLS version 1.2 and 1.3 only
     ssl_session_tickets off;  
     ssl_protocols TLSv1.2 TLSv1.3;
     ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
     ssl_prefer_server_ciphers off;  

     # HSTS (ngx_http_headers_module is required)
     # *************************************************************************
     # WARNING - Wrong headers can create serious problems. Read docs otherwise
     #           all 3rd party scripts/ads won't load and in some case 
     #           browser won't work. Read docs @ https://developer.mozilla.org
     # ************************************************************************* 
     add_header Strict-Transport-Security "max-age=63072000" always;
     add_header X-Content-Type-Options "nosniff" always;
     add_header X-Frame-Options "SAMEORIGIN" always;
     add_header X-Xss-Protection "1; mode=block" always;
     add_header Referrer-Policy  strict-origin-when-cross-origin always;
     add_header Feature-policy "accelerometer 'none'; camera 'none'; geolocation 'none'; gyroscope 'none'; magnetometer 'none'; microphone 'none'; payment 'none'; usb 'none'" always;
     # ***************************************************************************************************
     # WARNING: The HTTP Content-Security-Policy response header allows sysadmin/developers 
     # to control resources the user agent is allowed to load for a given page. 
     # Wrong config can create problems for third party scripts/ad networks. Hence read the following url: 
     # https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
     # ****************************************************************************************************
     add_header content-security-policy "default-src https://www.nixcraft.com:443" always;  

     # OCSP stapling
     # Verify chain of trust of OCSP response using Root CA and Intermediate certs
     ssl_stapling on;
     ssl_stapling_verify on;  
     ssl_trusted_certificate /etc/nginx/ssl/letsencrypt/www.nixcraft.com/www.nixcraft.com.fullchain.cer;  

     # Replace with the IP address of your resolver
     resolver 8.8.8.8;
    }