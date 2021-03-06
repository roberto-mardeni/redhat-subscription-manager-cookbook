#
# Author:: Chef Partner Engineering (<partnereng@chef.io>)
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module RhsmCookbook
  class RhsmErrata < ChefCompat::Resource
    include RhsmCookbook::RhsmHelpers

    resource_name :rhsm_errata

    property :errata_id, kind_of: String, name_property: true

    action :install do
      execute "Install errata packages for #{errata_id}" do
        command "yum update --advisory #{errata_id} -y"
        action :run
      end
    end
  end
end
