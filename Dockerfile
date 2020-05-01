FROM nginx

##copy to directory
COPY index.html /usr/share/nginx/html/

## Step 2:
EXPOSE 80

