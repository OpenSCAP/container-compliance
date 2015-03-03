# Container Compliance

Resources and tools to assert compliance of containers (docker, rocker, ...).

## Scanning Docker image using OpenSCAP

The very first use case is to run the offline scan of the container image.

  ```
  # docker-oscap [image_name] [oscap_arguments]
  ```

### Examplary usage

Tested on Fedora host.

  ```
  # yum install scap-security-guide openscap-scanner docker-io
  # sed -i 's/<platform idref=.*$//g' /usr/share/xml/scap/ssg/fedora/ssg-fedora-ds.xml
  # service docker start
  # docker pull fedora
  # docker-oscap fedora xccdf eval \
      --profile xccdf_org.ssgproject.content_profile_common \
      /usr/share/xml/scap/ssg/fedora/ssg-fedora-ds.xml
  ```

## Future features

### Scanning running container
Similar to scanning image, just scanning the container. The result may differ
(image vs containter) due to defined mount points.

### Vulnerability scan of image

Another use-case is to scan docker image for known vulnerabilities.
The output of the tool could look like:

  ```
  # docker-oscap cve --all --download --arf report-arf.xml
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
