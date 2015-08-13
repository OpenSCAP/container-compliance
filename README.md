# Container Compliance

Resources and tools to assert compliance of containers (rocket, docker, ...).

+ Assessing running containers and cold images
+ Vulnerability and compliance audit

## Vulnerability scan of Docker image

  ```
  # oscap-docker image-cve IMAGE_NAME \
      [--results OVAL.XML [--report REPORT.HTML]]
  ```

This command will attach docker image, determine OS variant/version, download CVE stream
applicable to the given OS, and finally run vulnerability scan.

### Exemplary usage

Tested on Fedora host.

  ```
  # yum install openscap-scanner docker-io
  # service docker start
  # docker pull docker.io/rhel7
  # oscap-docker image-cve docker.io/rhel7 \
      --results oval.xml --report rhel7.html
  $ firefox rhel7.html
  ```

## Scanning Docker image using OpenSCAP

Run any OpenSCAP command within chroot of mounted docker image.

  ```
  # oscap-docker image IMAGE_NAME [OSCAP_ARGUMENTS]
  ```

Learn more about OSCAP_ARGUMENTS in `man oscap`.

### Exemplary usage

Tested on Fedora host.

  ```
  # yum install scap-security-guide openscap-scanner docker-io
  # sed -i 's/<platform idref=.*$//g' /usr/share/xml/scap/ssg/fedora/ssg-fedora-ds.xml
  # service docker start
  # docker pull fedora
  # oscap-docker image fedora xccdf eval \
      --profile xccdf_org.ssgproject.content_profile_common \
      /usr/share/xml/scap/ssg/fedora/ssg-fedora-ds.xml
  ```

## Scanning Docker container

Run OpenSCAP scan within chroot of running docker container. This may differ
from scanning docker image due to defined mount points.

  ```
  # oscap-docker container CONTAINER_NAME [OSCAP_ARGUMENTS]
  ```

## Vulnerability scan of Docker container

Run OpenSCAP scan within chroot of running docker container. This may differ
from scanning docker image due to defined mount points.

  ```
  # oscap-docker container-cve CONTAINER_NAME \
      [--results OVAL.XML [--report REPORT.HTML]]
  ```

## Future features

### Vulnerability scan of all images

The output of the tool could look like:

  ```
  # oscap-docker cve --all --download --arf report-arf.xml
  Fetching OVAL definitions for RHSA ........ ok
  Inflating ....... ok
  Scanning rhel7-elasticsearch ...... ok (compliant, no CVE identified)
  Scanning rhel7-mongodb ......... fail (2 CVE found)
  Scanning ubuntu-httpd ......... notchecked (no CVE definitions)
  Exporting Asset Report ......... ok
  CVE Scan finished in 1m35s
  ```

## Copyright

Copyright (c) 2014--2015 Šimon Lukašík

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
