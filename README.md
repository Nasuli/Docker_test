# Docker_test
This repository is a part of a test assiment for a position of bioinformatitian (quality control of NGS data). A Dockerfile represented in the repository allows easily install and use a number of programs for bioinformatics data analysis. It includes:
- samtools (ver. 1.20),
- htslib (ver. 1.20),
- bsftools (ver. 1.20),
- vcftools (ver. 0.1.16). 
In addition to specific programs, buided image will contain general programs like libdeflate (ver. 1.21) and cmake (ver. 3.30.3).

To build the Docker-image, you should run the subsequent commands:
1. Clone the repository to your local machine:
git clone https://github.com/Nasuli/Docker_test.git
2. Go to the uploaded directory:
cd Docker_test/
3. Run building of a Docker image based on the exsisting Dockerfile:
docker build . -f Dockerfile -t testimage

To run Docker container in interactive mode:
docker run --rm -it testimage
 
You can test the Docker container in interactive mode by running the following commands:

samtools --help
$SAMTOOLS -- version
$BCFTOOLS --help
vcftools --version
________________________________________________________________

Настоящий репозиторий является частью тестового задания на позицию биоинформатика (контроль качества данных NGS). Представленный в репозитории Dockerfile используется для создания Docker-образа с предустановленными программами для биоинформатического анализа данных. В образ включены следующие программы:
- samtools (ver. 1.20),
- htslib (ver. 1.20),
- bsftools (ver. 1.20),
- vcftools (ver. 0.1.16). 
Помимо перечисленных программ, образ содержит программы общего назначения, среди которых  libdeflate (ver. 1.21) и cmake (ver. 3.30.3).

Для корректной сборки Docker-образа необходимо выполнить ряд команд:
1. Клонировать текущий репозиторий на локальную машину:
git clone https://github.com/Nasuli/Docker_test.git
2. Зайти в скачанную директорию:
cd Docker_test/
3. Запустить сбор Docker-образа на основе существующего Docker файла:
docker build . -f Dockerfile -t testimage

Собранный образ запускается в интерактивном режиме следующей командой:
docker run --rm -it testimage

Для проверки корректности компилляции программ и работы контейнера, зайдите в образ в интерактивном режиме и запустите следующие команды:
samtools --help
$SAMTOOLS -- version
$BCFTOOLS --help
vcftools --version
