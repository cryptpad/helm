# CryptPad Helm Chart

This is initial version of Cryptpad chart helm [Helm Chart](https://helm.sh/) for ease deployment on Kubernetes. 

## Requirements

* Kubernetes 1.23+

## Usage

```bash
helm repo add cryptpad-xwikisas https://git.xwikisas.com/api/v4/projects/439/packages/helm/main
helm install cryptpad cryptpad-xwikisas/cryptpad 
```

## TODO list

* [Testing] Provide all configs.js (ie storage, adminKeys, other custom configs) to be made using helm/yaml values. 
* [Testing] Create Storage options and/or kind (Deployment/StatefulSet)
* [Testing] Custom configs/mappings (customize) and customs configs apps.  
* Provide example/custom files mapping for customize directory. 
* Continue to use image from (promasu/cryptpad) ? 
* Review checkup since some returns seams to be ok but are failing on checking
* Instructions to setup (if necessary) custom dh parameteres https://kubernetes.github.io/ingress-nginx/examples/customization/ssl-dh-param/
* Create unit tests for important defaults/settings
* Prepare some integrated tests to be used on CI/CD
* Review project and final repository/license/instructions 

# License

![AGPL logo](https://www.gnu.org/graphics/agplv3-155x51.png "GNU Affero General Public License")

This software is and will always be available under the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the License, or (at your option)
any later version.