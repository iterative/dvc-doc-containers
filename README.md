This repository contains `Dockerfile`s to create images to simulate
documentation examples in the [DVC documentaion](https://dvc.org/doc/) and
[Katacoda scenarios](https://katacoda.com/dvc/). 

`build-all.zsh` script builds and pushes all images. To update the images, you
simply need:

```bash
./build-all.zsh
```

Note that `build-all.zsh` script has a `TAGPREFIX` setting which should be set
to a Docker hub id. The script will report errors if you don't have permission
to push to [docker.io/dvcorg][https://docker.io/dvcorg]. You can change
`TAGPREFIX` in `build-all.zsh` to use the script to manage your own images. 

Each leaf folder contains a `Dockerfile` to build image and an (optional)
`Dockertag` file that contains suffix portion of image id in its first line. If
`Dockertag` file is not provided, image id for the image is produced by
changing `<space>` and `/`s in directory name to `-`.

As of April 2021, the repository contains images for Katacoda getting started
scenarios.