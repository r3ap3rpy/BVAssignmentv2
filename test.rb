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

only_if { os.linux? }
describe auditd do
  its(:lines) { should include('-w /usr/bin/docker -p rwxa -k docker') }
end
describe service('auditd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

