require 'spec_helper'

describe 'umd::umd4' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'CentOS',
        'operatingsystemrelease' => ['7'],
      },
      {
        'operatingsystem'        => 'Scientific',
        'operatingsystemrelease' => ['7'],
      },
    ],
  }
  on_supported_os(test_on).each do |os, os_facts|
    let(:facts) { os_facts }

    it { is_expected.to compile }

    it "check umd repos" do
      is_expected.to contain_package('umd-release')
    end
  end
end
