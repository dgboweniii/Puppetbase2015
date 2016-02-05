# Class: figlet_motd
#
# This module manages figlet_motd
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class figlet_motd (
                    $motdText="Motd Default",
                   )

  {
    package { "figlet": ensure => "installed" }

    exec { "Set /etc/motd text":
             command => "figlet  $motdText > /etc/motd",
             path    => "/usr/bin:/usr/lib:/bin",
             unless  => "grep -q \"$(figlet $motdText)\" /etc/motd",
             require => Package["figlet"],
          }

  }

