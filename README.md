# CryptPad Helm Chart

This is the [CryptPad](https://cryptpad.org) [Helm Chart](https://helm.sh/) for easy deployment on Kubernetes. 

## Requirements

* Kubernetes 1.23+

## Usage

```bash
helm repo add cryptpad-github https://cryptpad.github.io/helm
helm install cryptpad cryptpad-github/cryptpad 
```

Check [values.yaml](charts/cryptpad/values.yaml) for custom values/settings. 

# License

![AGPL logo](https://www.gnu.org/graphics/agplv3-155x51.png "GNU Affero General Public License")

This software is and will always be available under the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the License, or (at your option)
any later version.
