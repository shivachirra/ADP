server {
        listen 80;
        listen [::]:80;

        root /var/www/mythirdpage/html;
        index index.html index.htm index.nginx-debian.html;

        server_name mythirdpage.com;
	rewrite ^/(.*)$ http://127.0.0.1/3.html permanent;

        location / {
                try_files $uri $uri/ =404;
        }
}
