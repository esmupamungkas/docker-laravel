<h3 align="center">
<em>"With everyone's super. No one will be."</em><br>
-- Syndrome (The Incredibles)
</h3>

## Overview

### # About Project
This project was made to run a Laravel-based application by utilizing minimal docker container in a case where application was configured to connect to a remote database inside other server and there's a preinstalled webserver inside host.

- Built using official image with PHP 8.2 FPM preinstalled, based on Alpine Linux.
- Nginx webserver with preconfigured configurations to run Laravel-based application, installed inside this container, not by using separate container.
- Supervisor with a preconfigured configuration to run all services when container being run for the first time or after being restarted.

*You can use another PHP version provided on [PHP Docker Hub](https://hub.docker.com/_/php/tags?name=fpm-alpine).*

### # Running Container
Clone or copy all files and folder in this repository to your current application folder, and build the image :
```bash
docker build -t laravelfpm:latest . --no-cache
```
Run the container using docker compose :
```bash
docker compose up -d
```

> [!NOTE]
> Inside compose.yml, we can see current configuration :
> ```yaml
> services:
>   app:
>     image: laravelfpm:latest
>     container_name: myapp
>     volumes:
>       - .:/var/www/html
>     ports:
>       - "65080:80"
> ```
> - We mounts application folder as volume so we can do some codes or environment configuration update without rebuilding container, only container restart required.
> - Change container_name with your preferred name, or use my name if you have no idea.
> - Port bind to 65080, change it to your needs for reverse proxy or direct serve.

<br>
<h1 align="center"> Me no speak Americano? </h1>

### # Tentang Proyek
Proyek ini dibuat untuk menjalankan aplikasi Laravel di dalam server menggunakan container yang dibangun dengan minimal dan ada dalam kondisi dimana aplikasi dikonfigurasi untuk tersambung dengan database di server lain dan sudah ada webserver terinstall di host server.

- Dibangun menggunakan [official image](https://hub.docker.com/layers/library/php/8.1-fpm-alpine/images/sha256-fed51bf5b0a3c41418d6252e276d3b82c3077517099095eee67e1d652ea4372c?context=explore) yang sudah terpasang PHP 8.1 FPM, dan berbasiskan Alpine Linux.
- Nginx webserver dengan konfigurasi preconfigured untuk kebutuhan menjalankan aplikasi berbasis Laravel, terpasang di dalam container, bukan menggunakan container terpisah.
- Supervisor dengan konfigurasi preconfigured untuk menjalankan semua service saat container dijalankan atau direstart

*Versi PHP bisa diganti dengan yang tersedia pada [Docker Hub PHP](https://hub.docker.com/_/php/tags?name=fpm-alpine).*

### # Menjalankan Container
Clone atau salin semua file dan folder di dalam repo ini ke dalam folder aplikasi, lalu build image :
```bash
docker build -t laravelfpm:latest . --no-cache
```
Lalu jalankan image tersebut dengan docker compose :
```bash
docker compose up -d
```
> [!NOTE]
> Di dalam file compose.yml, bisa dilihat konfigurasi sebagai berikut :
> ```yaml
> services:
>   app:
>     image: laravelfpm:latest
>     container_name: myapp
>     volumes:
>       - .:/var/www/html
>     ports:
>       - "65080:80"
> ```
> - Mount folder aplikasi sebagai volume sehingga kita bisa melakukan update pada kode dan konfigurasi environment tanpa melakukan rebuild container, hanya perlu restart container.
> - Ubah container_name dengan nama yang diinginkan, atau gunakan nama saya jika tidak punya ide.
> - Binding port dilakukan ke port 65080, sesuaikan dengan kebutuhan untuk reverse proxy atau akses langsung.
