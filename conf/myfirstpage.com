server {
        listen 80;
        listen [::]:80;

        root /var/www/myfirstpage/html;
        index index.html index.htm index.nginx-debian.html;

        server_name myfirstpage.com;
	rewrite ^/(.*)$ http://127.0.0.1/1.html permanent;

        location / {
                try_files $uri $uri/ =404;
        }
}
