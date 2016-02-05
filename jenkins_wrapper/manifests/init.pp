# Class: jenkins_wrapper
#
# This module manages jenkins_wrapper
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage: include 'jenkins_wrapper'
#

class jenkins_wrapper {
       
       Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ], 
              logoutput => on_failure,  
              }
       
       
       class{jenkins: configure_firewall => false }
        
       jenkins::plugin {"git" : ;}
       jenkins::plugin {"github" : ;}
       jenkins::plugin {"msbuild" : ;}
       jenkins::plugin {"parameterized-trigger" : ;}
       jenkins::plugin {"token-macro" : ;}
       jenkins::plugin {"scm-api" : ;}
       jenkins::plugin {"promoted-builds" : ;}
       jenkins::plugin {"git-client" : ;}
       jenkins::plugin {"multiple-scms" : ;}
       jenkins::plugin {"github-api" : ;}
       jenkins::plugin {"conditional-buildstep" : ;}
       jenkins::plugin {"rebuild" : ;}
       jenkins::plugin {"run-condition" : ;} 
       jenkins::plugin {"global-build-stats" : ;} 
       jenkins::plugin {"jobgenerator" : ;} 
       jenkins::plugin {"disable-failed-job" : ;}   
       jenkins::plugin {"embeddable-build-status" : ;} 
       jenkins::plugin {"extended-read-permission" : ;}
       jenkins::plugin {"postbuild-task" : ;}                           
       jenkins::plugin {"JDK_Parameter_Plugin" : ;}
       jenkins::plugin {"jobConfigHistory" : ;}                                                      
       jenkins::plugin {"preSCMbuildstep" : ;}
       jenkins::plugin {"configurationslicing" : ;}                           
       jenkins::plugin {"build-pipeline-plugin" : ;}
       jenkins::plugin {"jquery" : ;}
       jenkins::plugin {"dashboard-view" : ;}
       jenkins::plugin {"logfilesizechecker" : ;}
       jenkins::plugin {"jython" : ;}
       jenkins::plugin {"gradle" : ;}
       jenkins::plugin {"build-timeout" : ;}
       jenkins::plugin {"groovy" : ;}
       jenkins::plugin {"claim" : ;}
       jenkins::plugin {"python" : ;}
       jenkins::plugin {"PrioritySorter" : ;}
       jenkins::plugin {"timestamper" : ;}
       jenkins::plugin {"email-ext" : ;}
       jenkins::plugin {"analysis-core" : ;}       
       jenkins::plugin {"config-file-provider" : ;}

       file { "/root/resolve_jenkins_dependencies.sh":
                      mode   => "755",
                      owner  => root,
                      group  => root,
                      source => "puppet:///modules/jenkins_wrapper/resolve_jenkins_dependencies.sh"
                      }    

      package { "unzip": ensure => "installed" } 
      package { "groovy": ensure => "installed" } 
      


/* 
      jenkins::user {'mbittner':
                      email      => 'mbittner@nexient.com', 
                      password   => 'password',                
                    }
       
        ->

       exec { "Resolve Jenkins Plugin Dependencies":
                      command => "/root/resolve_jenkins_dependencies.sh",
                      path    => [ "/usr/local/bin/", "/bin/", "/root/", "/usr/bin/" ],
                      user    => root, 
                      require => [ File['/root/resolve_jenkins_dependencies.sh'], Package['unzip'] ]
                            
            }
*/
}
