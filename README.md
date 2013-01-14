Description
===========

Installs and configures Java extras.

Currently supports installing JCE unlimited strength jurisdiction policy files for JDK 6.

Requirements
============

* java

Attributes
==========

* `node['java']['jce_policy']['6']['url']` Download URL for jce_policy
* `node['java']['jce_policy']['6']['checksum']` Download checksum for jce_policy

Recipes
==========

### jce_policy

Adds Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files


License
=========

Copyright 2013, CultureJam, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

