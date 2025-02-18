# DockerMNCore2

## Usage

```bash
git clone https://github.com/zacky1972/docker_mncore2.git
cd docker_mncore2
docker image build --rm --no-cache --pull -t zacky1972/mncore2 .
cd (directory_with_assembly_code)
docker run -v /$(pwd):/home/mncore2 -it --platform=linux/amd64 zacky1972/mncore2
% assembler3 ...
% gpfn3_package_main ...
```
