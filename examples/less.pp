#sudo puppet module install gajdaw-nodejs
#sudo puppet apply -e "include nodejs"
#sudo npm install -g less

include nodejs

exec { 'install less node module':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => 'npm install -g less &> /dev/null',
    require => Class['nodejs'],
}
