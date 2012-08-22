default['descartes']['user'] = "descartes"

default['descartes']['gems'] = [
                                { 'name' => 'rake'},
                                { 'name' => 'sinatra', 'version' => '1.3.'},
                                { 'name' => "thin", 'version' => "1.2.10" },
                                { 'name' => "pg"},
                                { 'name' => "sequel" },
                                { 'name' => "omniauth", 'version' => "0.3.2",
                                  'git' => "git://github.com/intridea/omniauth",
                                  'branch' => '0-3-stable' },
                                { 'name' => "openid-redis-store" },
                                { 'name' => 'rack-canonical-host' },
                                { 'name' => 'rack-ssl-enforcer' },
                                { 'name' => 'haml' },
                                { 'name' => 'json' }
                               ]

