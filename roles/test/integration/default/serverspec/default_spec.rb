require 'serverspec'
set :backend, :exec

vars = YAML.load_file('/tmp/kitchen/roles/devops/defaults/main.yml')
describe group(vars['local_user']) do
   it { is_expected.to exist }
end

describe user(vars['local_user']) do
    it { is_expected.to exist }
    it { is_expected.to belong_to_group 'mike' }
    it { is_expected.to have_login_shell '/bin/bash' }
end

#check that .ssh has right permissions
#describe command("ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no gitlab ps") do
#    let(:sudo_options) { '-u mike -i' }
#    its(:stdout) { should contain('gitlab') }
#end
