require 'spec_helper_acceptance'

describe 'Scenario: install foreman-proxy with ansible plugin'  do
  before(:context) { purge_foreman_proxy }

  include_examples 'the example', 'ansible.pp'

  it_behaves_like 'the default foreman proxy application'

  package_name = ['debian', 'ubuntu'].include?(os[:family]) ? 'python3-ansible-runner' : 'ansible-runner'
  describe package(package_name) do
    it { is_expected.to be_installed }
  end
end
