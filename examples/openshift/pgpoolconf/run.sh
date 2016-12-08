#!/bin/bash
# Copyright 2016 Crunchy Data Solutions, Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source $BUILDBASE/examples/envvars.sh

echo "this example depends on the single-master example being run prior"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
oc create -f $DIR/pgpool-pvc.json

oc process -f $DIR/pgpool-rc.json -v CCP_IMAGE_TAG=$CCP_IMAGE_TAG | oc create -f -
