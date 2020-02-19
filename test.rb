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
                                           