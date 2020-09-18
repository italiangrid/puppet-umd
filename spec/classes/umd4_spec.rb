require 'spec_helper'

describe 'umd4' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it "check umd-release" do
        is_expected.to contain_package('umd-release')
      end
    end
  end
end
