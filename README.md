# WSO2 Docker build

##Requirements

- Zip file from https://github.com/wso2/product-apim/releases/tag/v4.0.0/ 
  Unzip into a folder named wso2am-4.0.0 and place this folder in same folder as Dockerfile
- Tarball jdk-11.0.5_linux-x64_bin.tar.gz https://www.oracle.com/fr/java/technologies/javase/jdk11-archive-downloads.html

Release notes at: https://github.com/wso2/product-apim/releases/tag/v4.0.0/

## build
```
docker build -t wso2:1.0.0 .
```

## run

```
docker run  -it -p 9443:9443 -p 8243:8243 -p 8280:8280 wso2:1.0.0
```

https://localhost:9443/


### WSO2 products installed

- https://localhost:9443/carbon
  This is the main admin console (aka carbon).

- https://localhost:9443/admin/dashboard
  APIM Admin portal. This portal is used to define policies, API categories, key managers, workflows, gateways and much more.

- https://localhost:9443/publisher/apis
  API Publisher. All published and management of their lifecycle goes through here.

- https://localhost:9443/devportal/apis
  Developer portal. This is WSO2 developer portal to view published APIs and try them out.

