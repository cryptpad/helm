# CryptPad Helm Chart

This is initial version of Cryptpad chart helm [Helm Chart](https://helm.sh/) for ease deployment on Kubernetes. 

## Requirements

* Kubernetes 1.23+

## Roadmap

* Provide all configs.js (ie storage, adminKeys, other custom configs) to be made using helm/yaml values. 
* Create Storage options and/or kind (Deployment/StatefulSet)
* Custom configs/mappings (customize) and customs configs apps.  
* Continue to use image from (promasu/cryptpad) ? 
* Review checkup since some returns seams to be ok but are failing on checking
* Instructions to setup (if necessary) custom dh parameteres https://kubernetes.github.io/ingress-nginx/examples/customization/ssl-dh-param/
* Review project and final repository/license/instructions 

# License

![AGPL logo](https://www.gnu.org/graphics/agplv3-155x51.png "GNU Affero General Public License")

This software is and will always be available under the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the License, or (at your option)
any later version.