# ARGoS in Docker

> Portable robot simulation environment, using [ARGoS](https://github.com/ilpincy/argos3). Built within docker containers & displayed via browser-based VNC (noVNC), ARGoS should now be accessable on **all platforms**.

## Usage
Simply build and run the container:
```
docker-compose up --build
```
Since ARGoS simulations rely on Qt, there must be a display output present. Therefore, a VNC server is used to render LXDE.

Visit http://localhost:6080 on your browser of choice, to display the GUI.
