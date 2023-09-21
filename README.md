<div align="center">

  <img src="assets/logo.png" alt="logo" width="300" height="auto" />
  <h1>CryptPad Helm Chart</h1>
  
  <p>
    This is the [CryptPad](https://cryptpad.org) [Helm Chart](https://helm.sh/) for easy deployment on Kubernetes. 
  </p>
  
  
<!-- Badges -->
<p>
  <a href="https://github.com/cryptpad/helm/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/cryptpad/helm" alt="contributors" />
  </a>
  <a href="https://github.com/cryptpad/helm/commits/main">
    <img src="https://img.shields.io/github/last-commit/cryptpad/helm" alt="last update" />
  </a>
  <a href="https://github.com/cryptpad/helm/network/members">
    <img src="https://img.shields.io/github/forks/cryptpad/helm" alt="forks" />
  </a>
  <a href="https://github.com/Louis3797/cryptpad/helm">
    <img src="https://img.shields.io/github/stars/cryptpad/helm" alt="stars" />
  </a>
  <a href="https://github.com/cryptpad/helm/issues/">
    <img src="https://img.shields.io/github/issues/cryptpad/helm" alt="open issues" />
  </a>
  <a href="https://github.com/cryptpad/helm/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/cryptpad/helm.svg" alt="license" />
  </a>
</p>
   
<h4>
    <a href="https://github.com/cryptpad/helm">Documentation</a>
  <span> · </span>
    <a href="https://github.com/cryptpad/helm/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/cryptpad/helm/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [:notebook\_with\_decorative\_cover: Table of Contents](#notebook_with_decorative_cover-table-of-contents)
  - [:star2: About the Project](#star2-about-the-project)
  - [:toolbox: Getting Started](#toolbox-getting-started)
    - [:bangbang: Prerequisites](#bangbang-prerequisites)
    - [:keyboard: Usage](#keyboard-usage)
    - [:test\_tube: Running Tests](#test_tube-running-tests)
  - [:wave: Contributing](#wave-contributing)
  - [:warning: License](#warning-license)
  - [:handshake: Authors](#handshake-authors)

<!-- About the Project -->
## :star2: About the Project

Aster is designed to efficiently collect metrics from a REST API, transform them into chargeable data, expose the API and SDKs, create invoices and bills, and generate alerts based on specified rules.

<!-- Getting Started -->
## :toolbox: Getting Started

<!-- Prerequisites -->
### :bangbang: Prerequisites

This project requires [Kubernetes 1.23+](https://kubernetes.io/) and [Helm](https://helm.sh/docs/intro/install/) installed on your system

### :keyboard: Usage

Check [values.yaml](charts/cryptpad/values.yaml) for custom values/settings.

Install the Helm Chart using:

```bash
helm repo add cryptpad-github https://cryptpad.github.io/helm
helm install cryptpad cryptpad-github/cryptpad 
```

<!-- Running Tests -->
### :test_tube: Running Tests

To run tests, run the following command

```bash
  for FILE in charts/*; do
     helm unittest $FILE
  done
```

<!-- Contributing -->
## :wave: Contributing

<a href="https://github.com/cryptpad/helm/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cryptpad/helm" />
</a>


Contributions are always welcome!

See `CONTRIBUTING.md` for ways to get started.

<!-- License -->
## :warning: License

![AGPL logo](https://www.gnu.org/graphics/agplv3-155x51.png "GNU Affero General Public License")

This software is and will always be available under the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

<!-- Authors -->
## :handshake: Authors

This project was maintained by [Guilherme Sautner](https://www.xwiki.org/xwiki/bin/view/XWiki/sautner)

Project Link: [https://github.com/cryptpad/helm](https://github.com/cryptpad/helm)
