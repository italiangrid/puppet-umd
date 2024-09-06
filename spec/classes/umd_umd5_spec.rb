require 'spec_helper'

describe 'umd::umd5' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'AlmaLinux',
        'operatingsystemrelease' => ['9'],
      },
      {
        'operatingsystem'        => 'RedHat',
        'operatingsystemrelease' => ['9'],
      },
    ],
  }
  on_supported_os(test_on).each do |os, os_facts|
    let(:facts) { os_facts }
    let(:params) do
      {
        enable_contrib: false,
        enable_testing: false,
      }
    end

    it { is_expected.to compile }

    it 'check umd repos' do
      is_expected.to contain_yumrepo('UMD-5')
      is_expected.to contain_yumrepo('UMD-5-contrib')
      is_expected.to contain_yumrepo('UMD-5-testing')
    end
  end
end
