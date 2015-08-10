#
# Class: autofs
#
# manages autofs (master and maps)
#
define autofs::target (
    $target_source = undef,
 ) {

    include autofs

    file { $target_source:
        ensure  => present,
        path    => "/etc/${name}",
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => $target_source,
        require => Package[autofs],
        notify  => Service['autofs'],
    }

}
