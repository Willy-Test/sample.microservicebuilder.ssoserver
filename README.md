# Microservice Builder Sample - single sign on service

See the [sample documentation](https://github.com/WASdev/sample.microservicebuilder.docs) for more information.

To rebuild the username/password data, 
  ```
  kubectl create secret generic liberty-userids --dry-run -o yaml --from-file="userids.xml" >! chart/ssoserver/templates/deploy-ssoservice.yaml
  ```



