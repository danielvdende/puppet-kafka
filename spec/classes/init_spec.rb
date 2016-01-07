require 'spec_helper'

describe 'kafka' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "kafka class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kafka::params') }
          it { is_expected.to contain_class('kafka::install').that_comes_before('kafka::config') }
          it { is_expected.to contain_class('kafka::config').that_comes_before('kafka::service') }
          # it { is_expected.to contain_package('confluent-kafka-2.10.4').with_ensure('0.8.2.0-1') }
        end

        context "kafka class with parameters" do
          let(:params) {{
          :zookeeper_connect  => ['zk01.example.com:2181','zk02.example.com:2181'],
          :port               => 9000,
          :app_log_dir        => '/tmp/log/kafka',
          :log_dirs           => '/tmp/kafka1',
          :install_service    => true,
          :manage_service     => true,
          :service_name       => 'kafka',
          :manage_repo        => true,
          :jvm_heap_mem       => '-Xmx5G -Xms5G',
          :restart_on_change  => true,
          :reponame           => 'kafka',
          :repourl            => 'file:///kafka/',
          :repodescr          => 'descr'
          }}

          let (:facts) {
            facts.merge(:fqdn => 'test01.example.com')
          }

          it { is_expected.to compile.with_all_deps }


          # Ensure ZK string setup properly
          it { should contain_file('/etc/kafka/server.properties') \
                    .with_content(/zookeeper\.connect=zk01\.example\.com:2181,zk02\.example\.com:2181/)}

          it { should contain_file('/etc/kafka/server.properties').that_notifies('Class[kafka::service]') }

          # Ensure kafka_config hash gets passed in
          it { should contain_file('/etc/kafka/server.properties') \
                    .with_content(/port=9000/)}

          # Ensure broker id is set
          it { should contain_file('/etc/kafka/server.properties') \
                    .with_content(/broker.id=1/)}

          # Ensure app log dir created
          it { should contain_file('/tmp/log/kafka').with({
                        'ensure'  => 'directory',
                        'owner'   => 'kafka',
                        'group'   => 'kafka',
                        })}

          # Check app log was set
          it { should contain_file('/etc/kafka/log4j.properties') \
                    .with_content(/\/tmp\/log\/kafka/)}

          it { should contain_file('/etc/kafka/log4j.properties').that_notifies('Class[kafka::service]') }

          it { should contain_file('/tmp/kafka1').with({
                        'ensure'  => 'directory',
                        'owner'   => 'kafka',
                        'group'   => 'kafka',
                        })}

          # Ensure init script in place
          it { should contain_file('/etc/init.d/kafka').with({
                        'owner'   => 'root',
                        'group'   => 'root',
          })}

          # Ensure users setup
          it { should contain_user('kafka') }
          it { should contain_group('kafka') }

          it { should contain_service('kafka') }

          it { should contain_file('/etc/default/kafka').with({
                        'owner'     => 'kafka',
                        'group'     => 'kafka',
          })}
          it { should contain_file('/etc/default/kafka').that_notifies('Class[kafka::service]') }


        end
      end
    end
  end
end
