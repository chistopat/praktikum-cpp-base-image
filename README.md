# Yandex.Praktikum CPP 
## Базовый docker: ubuntu gcc cmake 

---
### Подготовка
#### MacOs
* Убедиться что установлены xcode command line tools
   
   `sudo xcode-select --install`

* Установить пакетный менеджер `brew` для mac https://brew.sh/
* Установить `docker desktop` https://www.docker.com/products/docker-desktop

#### Todo: Linux
...

#### Todo: Windows
...

### Настройка
* создать директорию для проекта, например так
```shell
mkdir -p ~/my_docker_projects
cd ~/my_docker_projects
```

* клонировать github репозиторий

```shell
git clone https://github.com/chistopat/praktikum-cpp-base-image
cd praktikum-cpp-base-image
```

* собрать докер образ 
```shell
docker build . -t praktikum-cpp
```

* убедиться что образ создан
```shell
chistopat@macmini praktikum-cpp-base-image % docker images
REPOSITORY          TAG         IMAGE ID       CREATED         SIZE
praktikum-cpp       latest      1dd1f173a89a   21 hours ago    607MB
```

* запустить контейнер 
```shell
 docker run --rm -it -v $(pwd):/praktikum/src praktikum-cpp
```

* проверить что внутри контенера доступна рабочая директория
```shell
root@eb4c6d286ef5:/# cd /praktikum/src
root@eb4c6d286ef5:/praktikum/src# ls
Dockerfile  LICENSE  README.md  main.cpp
```

* скомпилировать проект
```shell
g++ -g -std=c++17 /praktikum/src/main.cpp -pthread -ltbb -o /praktikum/src/main
```

* запустить бинарник
```shell
root@54efca28f291:/# cd praktikum/src/    
root@54efca28f291:/praktikum/src# ./main
std::accumulate execution time: 7497 ms.
std::reduce execution time: 6410 ms.
```