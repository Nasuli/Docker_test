# FMBA_task2_Docker
### English version. For version in Russian, scroll down.
This repository is a part of a test assiment for a position of bioinformatitian (quality control of NGS data). The provided Dockerfile allows installation and usage of several programs for bioinformatics data analysis. It includes:
- samtools (ver. 1.20),
- htslib (ver. 1.20),
- bsftools (ver. 1.20),
- vcftools (ver. 0.1.16).
  
In addition to specific programs, buided image will contain some general programs like libdeflate (ver. 1.21) and cmake (ver. 3.30.3).

#### To build the Docker-image, you should run the subsequent commands:
1. Clone the repository to your local machine:
```
git clone https://github.com/Nasuli/FMBA_task2_Docker.git
```
2. Go to the uploaded directory:
```
cd FMBA_task2_Docker/
```
3. Build the Docker image based on the existing Dockerfile:
```
docker build . -f Dockerfile -t testimage
```

#### To run the Docker container in interactive mode:
```
docker run --rm -it testimage
```
 
To ensure everything works as expected, you can run the following commands:
```
samtools --help
$SAMTOOLS -- version
$BCFTOOLS --help
vcftools --version
```
________________________________________________________________
### Версия на русском языке.
Репозиторий является частью тестового задания на позицию биоинформатика (контроль качества данных NGS). Представленный в репозитории Dockerfile используется для создания Docker-образа с предустановленными программами для биоинформатического анализа данных. В образ включены следующие программы:
- samtools (ver. 1.20),
- htslib (ver. 1.20),
- bsftools (ver. 1.20),
- vcftools (ver. 0.1.16).
  
Помимо перечисленных программ, образ содержит программы общего назначения, среди которых  libdeflate (ver. 1.21) и cmake (ver. 3.30.3).

#### Для корректной сборки Docker-образа необходимо выполнить ряд команд:
1. Клонировать текущий репозиторий на локальную машину:
```
git clone https://github.com/Nasuli/FMBA_task2_Docker.git
```
2. Зайти в скачанную директорию:
```
cd FMBA_task2_Docker/
```
3. Запустить сборку Docker-образа на основе существующего Docker файла:
```
docker build . -f Dockerfile -t testimage
```

#### Запуск образа в интерактивном режиме:
```
docker run --rm -it testimage
```

Для проверки корректности компилляции программ и работы контейнера, зайдите в образ в интерактивном режиме и запустите следующие команды:
```
samtools --help
$SAMTOOLS -- version
$BCFTOOLS --help
vcftools --version
```
