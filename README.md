# ARGoS in Docker

> Portable robot simulation environment, using [ARGoS](https://github.com/ilpincy/argos3). Built within docker containers & displayed via browser-based VNC (noVNC), ARGoS should now be accessable on **all platforms**.

## Usage
```bash
$ docker run -p 6080:80 -v /dev/shm:/dev/shm /tjferrara/argos3
```
Visit http://localhost:6080 on your browser of choice, to display the GUI.

## Build it yourself

To build and run the container:
```bash
$ git clone https://github.com/tylerferrara/argos3-docker.git argos3-docker
$ cd argos3-docker
$ docker-compose up --build
```
**NOTE:** This can take up to 15min to compile as it builds ARGoS from source.
