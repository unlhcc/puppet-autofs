#
# Class: autofs
#
# manages autofs (master and maps)
#
class autofs (
    $package_ensure     = 'present',
    $service_ensure     = 'running',
    $service_enable     = true,
    $autofs_master      = undef,
 ) {

    package { 'autofs': ensure => $::autofs::package_ensure }

    service { 'autofs':
        ensure     => $::autofs::service_ensure,
        enable     => $::autofs::service_enable,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['autofs'],
    }

    file { 'autofs.master':
        ensure  => present,
        path    => '/etc/auto.master',
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => $::autofs::autofs_master,
        require => Package['autofs'],
        notify  => Service['autofs'],
    }

}
