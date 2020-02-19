describe docker.version do                                  
    its('Server.Version') {should cmp >= '19'}                 
    its('Client.Version') {should cmp >= '19'}                 
   end                                                         
                                                               
   describe docker_image('openjdk') do                         
      it { should exist }                                      
      its('tag') { should eq '8-jdk-alpine' }                  
   end                                                         
                                                               
   describe docker_image('bvassignment') do                    
      it { should exist }                                      
      its('tag') { should eq 'latest' }                        
   end                                                         
   describe service('docker') do                               
     it { should be_enabled }                                  
     it { should be_running }                                  
   end                                                         