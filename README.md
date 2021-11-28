# WSO2 4.0 Docker build

## Requirements

- Download the zip file from https://github.com/wso2/product-apim/releases/tag/v4.0.0/ 
  Unzip into a folder named wso2am-4.0.0 and place this folder in same folder as Dockerfile
- Download the Linux tar file jdk-11.0.5_linux-x64_bin.tar.gz from https://www.oracle.com/fr/java/technologies/javase/jdk11-archive-downloads.html and place in a folder called oracle

In the project folder you should now have two folders:
- wso2am-4.0.0
- oracle




## build
```
docker build -t wso2:1.0.0 .
```

## run

```
docker run -p 9443:9443 -p 8243:8243 -p 8280:8280 wso2:1.0.0
```


### WSO2 products installed

- https://localhost:9443/carbon
  This is the main admin console (aka carbon).

- https://localhost:9443/admin/dashboard
  APIM Admin portal. This portal is used to define policies, API categories, key managers, workflows, gateways and much more.

- https://localhost:9443/publisher/apis
  API Publisher. All published and management of their lifecycle goes through here.

- https://localhost:9443/devportal/apis
  Developer portal. This is WSO2 developer portal to view published APIs and try them out.

