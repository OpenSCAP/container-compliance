# Container Compliance

Resources and tools to assert compliance of containers (docker, rocker, ...).

## Scanning Docker image using OpenSCAP

The very first use case is to run the offline scan of the container.
The command-line arguments could mimics the oscap's like:

  # docker-oscap container-name xccdf eval --profile containers mypolicy.sds.xml

Anotheruse case is to scan docker image for known vulnerabilities.
The output of the tool could look like:

  ```
  # docker-compliance cve --all --download --arf report-arf.xml
  Fetching OVAL definitions for RHSA ........ ok
  Inflating ....... ok
  Scanning rhel7-elasticsearch ...... ok (compliant, no CVE identified)
  Scanning rhel7-mongodb ......... fail (2 CVE found)
  Scanning ubuntu-httpd ......... notchecked (no CVE definitions)
  Exporting Asset Report ......... ok
  CVE Scan finished in 1m35s
  ```

## Copyright

Copyright (c) 2014 Šimon Lukašík

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
