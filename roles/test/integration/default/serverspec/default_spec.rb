require 'serverspec'
set :backend, :exec

describe group('mike') do
   it { is_expected.to exist }
end

describe user('mike') do
    it { is_expected.to exist }
    it { is_expected.to belong_to_group 'mike' }
    it { is_expected.to have_login_shell '/bin/bash' }
end

