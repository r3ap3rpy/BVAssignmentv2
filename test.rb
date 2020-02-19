describe docker.version do                                  
    its('Server.Version') {should cmp >= '17'}                 
    its('Client.Version') {should cmp >= '17'}                 
end                                                                                                         
describe service('docker') do                               
    it { should be_enabled }                                  
    it { should be_running }                                  
end              
describe docker_image('bvassignment') do                    
    it { should exist }                                      
    its('tag') { should eq 'latest' }                        
end          

describe command('ausearch --input-logs -k docker | grep exec | grep user').stdout do
    it { should be_empty }
  end

describe file('/etc/docker') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/docker') do
    it { should exist }
    it { should be_directory }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should be_executable.by('owner') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should be_executable.by('group') }
    it { should be_readable.by('other') }
    it { should_not be_writable.by('other') }
    it { should be_executable.by('other') }
  end
  docker.containers.running?.ids.each do |id|
    container_info = docker.object(id)
    next if container_info['NetworkSettings']['Ports'].nil?
    container_info['NetworkSettings']['Ports'].each do |_, hosts|
      next if hosts.nil?
      hosts.each do |host|
        describe host['HostIp'].to_i.between?(1, 1024) do
          it { should_not eq '0.0.0.0' }
        end
      end
    end
  end