This repository contains `Dockerfile`s to create containers to run
documentation examples in the [DVC documentation](https://dvc.org/doc/) and
[Katacoda scenarios](https://katacoda.com/dvc/). 

`build-all.bash` script builds and pushes all images. To update the images, you
simply need:

```bash
./build-all.bash
```

Note that `build-all.bash` script has a `TAGPREFIX` setting which should be set
to a Docker Hub id. The script will report errors if you don't have permission
to push to [docker.io/dvcorg](https://docker.io/dvcorg). You can change
`TAGPREFIX` in `build-all.bash` to use the script to manage your own images. 

Each leaf folder contains a `Dockerfile` to build image and an (optional)
`Dockertag` file that contains suffix portion of image id in its first line. If
`Dockertag` file is not provided, image id is produced by changing `<space>`
and `/`s in directory name to `-`.

As of April 2021, the repository contains images for Katacoda Getting Started
scenarios.

The containers in this repository are also used in
[markdown-code-runner](https://github.com/iterative/markdown-code-runner) to
test [the scenarios](https://github.com/iterative/katacoda-scenarios) and [the
documentation](https://github.com/iterative/dvc.org). 
