<?php return array (
  'app' => 
  array (
    'name' => 'Booking',
    'env' => 'local',
    'debug' => true,
    'url' => 'http://localhost',
    'asset_url' => NULL,
    'timezone' => 'UTC',
    'locale' => 'en',
    'fallback_locale' => 'en',
    'faker_locale' => 'en_US',
    'key' => 'base64:aiICl8YYGXRHKGZbi3bIzJ2GhFDUI7BEeRySePGCPls=',
    'cipher' => 'AES-256-CBC',
    'providers' => 
    array (
      0 => 'Illuminate\\Auth\\AuthServiceProvider',
      1 => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
      2 => 'Illuminate\\Bus\\BusServiceProvider',
      3 => 'Illuminate\\Cache\\CacheServiceProvider',
      4 => 'Illuminate\\Foundation\\Providers\\ConsoleSupportServiceProvider',
      5 => 'Illuminate\\Cookie\\CookieServiceProvider',
      6 => 'Illuminate\\Database\\DatabaseServiceProvider',
      7 => 'Illuminate\\Encryption\\EncryptionServiceProvider',
      8 => 'Illuminate\\Filesystem\\FilesystemServiceProvider',
      9 => 'Illuminate\\Foundation\\Providers\\FoundationServiceProvider',
      10 => 'Illuminate\\Hashing\\HashServiceProvider',
      11 => 'Illuminate\\Mail\\MailServiceProvider',
      12 => 'Illuminate\\Notifications\\NotificationServiceProvider',
      13 => 'Illuminate\\Pagination\\PaginationServiceProvider',
      14 => 'Illuminate\\Pipeline\\PipelineServiceProvider',
      15 => 'Illuminate\\Queue\\QueueServiceProvider',
      16 => 'Illuminate\\Redis\\RedisServiceProvider',
      17 => 'Illuminate\\Auth\\Passwords\\PasswordResetServiceProvider',
      18 => 'Illuminate\\Session\\SessionServiceProvider',
      19 => 'Illuminate\\Translation\\TranslationServiceProvider',
      20 => 'Illuminate\\Validation\\ValidationServiceProvider',
      21 => 'Illuminate\\View\\ViewServiceProvider',
      22 => 'App\\Providers\\AppServiceProvider',
      23 => 'App\\Providers\\AuthServiceProvider',
      24 => 'App\\Providers\\EventServiceProvider',
      25 => 'App\\Providers\\RouteServiceProvider',
      26 => 'Modules\\ServiceProvider',
      27 => 'Spatie\\Permission\\PermissionServiceProvider',
      28 => 'Intervention\\Image\\ImageServiceProvider',
      29 => 'Barryvdh\\Debugbar\\ServiceProvider',
    ),
    'aliases' => 
    array (
      'App' => 'Illuminate\\Support\\Facades\\App',
      'Arr' => 'Illuminate\\Support\\Arr',
      'Artisan' => 'Illuminate\\Support\\Facades\\Artisan',
      'Auth' => 'Illuminate\\Support\\Facades\\Auth',
      'Blade' => 'Illuminate\\Support\\Facades\\Blade',
      'Broadcast' => 'Illuminate\\Support\\Facades\\Broadcast',
      'Bus' => 'Illuminate\\Support\\Facades\\Bus',
      'Cache' => 'Illuminate\\Support\\Facades\\Cache',
      'Config' => 'Illuminate\\Support\\Facades\\Config',
      'Cookie' => 'Illuminate\\Support\\Facades\\Cookie',
      'Crypt' => 'Illuminate\\Support\\Facades\\Crypt',
      'DB' => 'Illuminate\\Support\\Facades\\DB',
      'Eloquent' => 'Illuminate\\Database\\Eloquent\\Model',
      'Event' => 'Illuminate\\Support\\Facades\\Event',
      'File' => 'Illuminate\\Support\\Facades\\File',
      'Gate' => 'Illuminate\\Support\\Facades\\Gate',
      'Hash' => 'Illuminate\\Support\\Facades\\Hash',
      'Lang' => 'Illuminate\\Support\\Facades\\Lang',
      'Log' => 'Illuminate\\Support\\Facades\\Log',
      'Mail' => 'Illuminate\\Support\\Facades\\Mail',
      'Notification' => 'Illuminate\\Support\\Facades\\Notification',
      'Password' => 'Illuminate\\Support\\Facades\\Password',
      'Queue' => 'Illuminate\\Support\\Facades\\Queue',
      'Redirect' => 'Illuminate\\Support\\Facades\\Redirect',
      'Redis' => 'Illuminate\\Support\\Facades\\Redis',
      'Request' => 'Illuminate\\Support\\Facades\\Request',
      'Response' => 'Illuminate\\Support\\Facades\\Response',
      'Route' => 'Illuminate\\Support\\Facades\\Route',
      'Schema' => 'Illuminate\\Support\\Facades\\Schema',
      'Session' => 'Illuminate\\Support\\Facades\\Session',
      'Storage' => 'Illuminate\\Support\\Facades\\Storage',
      'Str' => 'Illuminate\\Support\\Str',
      'URL' => 'Illuminate\\Support\\Facades\\URL',
      'Validator' => 'Illuminate\\Support\\Facades\\Validator',
      'View' => 'Illuminate\\Support\\Facades\\View',
    ),
  ),
  'auth' => 
  array (
    'defaults' => 
    array (
      'guard' => 'web',
      'passwords' => 'users',
    ),
    'guards' => 
    array (
      'web' => 
      array (
        'driver' => 'session',
        'provider' => 'users',
      ),
      'api' => 
      array (
        'driver' => 'token',
        'provider' => 'users',
        'hash' => false,
      ),
    ),
    'providers' => 
    array (
      'users' => 
      array (
        'driver' => 'eloquent',
        'model' => 'App\\User',
      ),
    ),
    'passwords' => 
    array (
      'users' => 
      array (
        'provider' => 'users',
        'table' => 'password_resets',
        'expire' => 60,
      ),
    ),
  ),
  'booking' => 
  array (
    'booking_route_prefix' => 'booking',
    'services' => 
    array (
      'tour' => 'Modules\\Tour\\Models\\Tour',
    ),
    'payment_gateways' => 
    array (
      'offline_payment' => 'Modules\\Booking\\Gateways\\OfflinePaymentGateway',
      'paypal' => 'Modules\\Booking\\Gateways\\PaypalGateway',
      'stripe' => 'Modules\\Booking\\Gateways\\StripeGateway',
    ),
    'statuses' => 
    array (
      0 => 'выполнено',
      1 => 'обработка',
      2 => 'подтвержденный',
      3 => 'отмененный',
      4 => 'оплаченный',
      5 => 'неоплаченный',
    ),
  ),
  'broadcasting' => 
  array (
    'default' => 'null',
    'connections' => 
    array (
      'pusher' => 
      array (
        'driver' => 'pusher',
        'key' => NULL,
        'secret' => NULL,
        'app_id' => NULL,
        'options' => 
        array (
          'cluster' => NULL,
          'encrypted' => true,
        ),
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'default',
      ),
      'log' => 
      array (
        'driver' => 'log',
      ),
      'null' => 
      array (
        'driver' => 'null',
      ),
    ),
  ),
  'cache' => 
  array (
    'default' => 'file',
    'stores' => 
    array (
      'apc' => 
      array (
        'driver' => 'apc',
      ),
      'array' => 
      array (
        'driver' => 'array',
      ),
      'database' => 
      array (
        'driver' => 'database',
        'table' => 'cache',
        'connection' => NULL,
      ),
      'file' => 
      array (
        'driver' => 'file',
        'path' => '/opt/lampp/htdocs/booking8/storage/framework/cache/data',
      ),
      'memcached' => 
      array (
        'driver' => 'memcached',
        'persistent_id' => NULL,
        'sasl' => 
        array (
          0 => NULL,
          1 => NULL,
        ),
        'options' => 
        array (
        ),
        'servers' => 
        array (
          0 => 
          array (
            'host' => '127.0.0.1',
            'port' => 11211,
            'weight' => 100,
          ),
        ),
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'cache',
      ),
      'dynamodb' => 
      array (
        'driver' => 'dynamodb',
        'key' => NULL,
        'secret' => NULL,
        'region' => 'us-east-1',
        'table' => 'cache',
      ),
    ),
    'prefix' => 'laravel_cache',
  ),
  'database' => 
  array (
    'default' => 'mysql',
    'connections' => 
    array (
      'sqlite' => 
      array (
        'driver' => 'sqlite',
        'database' => 'booking8',
        'prefix' => '',
        'foreign_key_constraints' => true,
      ),
      'mysql' => 
      array (
        'driver' => 'mysql',
        'host' => '127.0.0.1',
        'port' => '3306',
        'database' => 'booking8',
        'username' => 'root',
        'password' => '',
        'unix_socket' => '',
        'charset' => 'utf8mb4',
        'collation' => 'utf8mb4_unicode_ci',
        'prefix' => '',
        'prefix_indexes' => true,
        'strict' => false,
        'engine' => NULL,
        'options' => 
        array (
        ),
      ),
      'pgsql' => 
      array (
        'driver' => 'pgsql',
        'host' => '127.0.0.1',
        'port' => '5432',
        'database' => 'booking8',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8',
        'prefix' => '',
        'prefix_indexes' => true,
        'schema' => 'public',
        'sslmode' => 'prefer',
      ),
      'sqlsrv' => 
      array (
        'driver' => 'sqlsrv',
        'host' => '127.0.0.1',
        'port' => '1433',
        'database' => 'booking8',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8',
        'prefix' => '',
        'prefix_indexes' => true,
      ),
    ),
    'migrations' => 'migrations',
    'redis' => 
    array (
      'client' => 'predis',
      'options' => 
      array (
        'cluster' => 'predis',
      ),
      'default' => 
      array (
        'host' => '127.0.0.1',
        'password' => NULL,
        'port' => 6379,
        'database' => 0,
      ),
      'cache' => 
      array (
        'host' => '127.0.0.1',
        'password' => NULL,
        'port' => 6379,
        'database' => 1,
      ),
    ),
  ),
  'debugbar' => 
  array (
    'enabled' => NULL,
    'except' => 
    array (
      0 => 'telescope*',
    ),
    'storage' => 
    array (
      'enabled' => true,
      'driver' => 'file',
      'path' => '/opt/lampp/htdocs/booking8/storage/debugbar',
      'connection' => NULL,
      'provider' => '',
    ),
    'include_vendors' => true,
    'capture_ajax' => true,
    'add_ajax_timing' => false,
    'error_handler' => false,
    'clockwork' => false,
    'collectors' => 
    array (
      'phpinfo' => true,
      'messages' => true,
      'time' => true,
      'memory' => true,
      'exceptions' => true,
      'log' => true,
      'db' => true,
      'views' => true,
      'route' => true,
      'auth' => true,
      'gate' => true,
      'session' => true,
      'symfony_request' => true,
      'mail' => true,
      'laravel' => false,
      'events' => false,
      'default_request' => false,
      'logs' => false,
      'files' => false,
      'config' => false,
      'cache' => false,
    ),
    'options' => 
    array (
      'auth' => 
      array (
        'show_name' => true,
      ),
      'db' => 
      array (
        'with_params' => true,
        'backtrace' => true,
        'timeline' => false,
        'explain' => 
        array (
          'enabled' => false,
          'types' => 
          array (
            0 => 'SELECT',
          ),
        ),
        'hints' => true,
      ),
      'mail' => 
      array (
        'full_log' => false,
      ),
      'views' => 
      array (
        'data' => false,
      ),
      'route' => 
      array (
        'label' => true,
      ),
      'logs' => 
      array (
        'file' => NULL,
      ),
      'cache' => 
      array (
        'values' => true,
      ),
    ),
    'inject' => true,
    'route_prefix' => '_debugbar',
    'route_domain' => NULL,
  ),
  'filesystems' => 
  array (
    'default' => 'local',
    'cloud' => 's3',
    'disks' => 
    array (
      'demo' => 
      array (
        'driver' => 'local',
        'root' => '/opt/lampp/htdocs/booking8/storage/demo',
      ),
      'local' => 
      array (
        'driver' => 'local',
        'root' => '/opt/lampp/htdocs/booking8/storage/app',
      ),
      'uploads' => 
      array (
        'driver' => 'local',
        'root' => '/opt/lampp/htdocs/booking8/public/uploads',
      ),
      'public' => 
      array (
        'driver' => 'local',
        'root' => '/opt/lampp/htdocs/booking8/storage/app/public',
        'url' => '/storage',
        'visibility' => 'public',
      ),
      's3' => 
      array (
        'driver' => 's3',
        'key' => NULL,
        'secret' => NULL,
        'region' => NULL,
        'bucket' => NULL,
        'url' => NULL,
      ),
    ),
  ),
  'hashing' => 
  array (
    'driver' => 'bcrypt',
    'bcrypt' => 
    array (
      'rounds' => 10,
    ),
    'argon' => 
    array (
      'memory' => 1024,
      'threads' => 2,
      'time' => 2,
    ),
  ),
  'image' => 
  array (
    'driver' => 'gd',
  ),
  'image-optimizer' => 
  array (
    'optimizers' => 
    array (
      'Spatie\\ImageOptimizer\\Optimizers\\Jpegoptim' => 
      array (
        0 => '-m85',
        1 => '--strip-all',
        2 => '--all-progressive',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Pngquant' => 
      array (
        0 => '--force',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Optipng' => 
      array (
        0 => '-i0',
        1 => '-o2',
        2 => '-quiet',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Svgo' => 
      array (
        0 => '--disable=cleanupIDs',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Gifsicle' => 
      array (
        0 => '-b',
        1 => '-O3',
      ),
    ),
    'binary_path' => '',
    'timeout' => 60,
    'log_optimizer_activity' => false,
  ),
  'installer' => 
  array (
    'core' => 
    array (
      'minPhpVersion' => '7.2.0',
    ),
    'final' => 
    array (
      'key' => true,
      'publish' => false,
    ),
    'requirements' => 
    array (
      'php' => 
      array (
        0 => 'openssl',
        1 => 'pdo',
        2 => 'mbstring',
        3 => 'tokenizer',
        4 => 'JSON',
        5 => 'cURL',
        6 => 'fileinfo',
      ),
      'apache' => 
      array (
        0 => 'mod_rewrite',
      ),
    ),
    'permissions' => 
    array (
      'public/uploads/' => '775',
      'storage/framework/' => '775',
      'storage/logs/' => '775',
      'bootstrap/cache/' => '775',
    ),
    'environment' => 
    array (
      'form' => 
      array (
        'rules' => 
        array (
          'app_name' => 'required|string|max:50',
          'environment' => 'required|string|max:50',
          'environment_custom' => 'required_if:environment,other|max:50',
          'app_log_level' => 'required|string|max:50',
          'app_url' => 'required|url',
          'database_connection' => 'required|string|max:50',
          'database_hostname' => 'required|string|max:50',
          'database_port' => 'required|numeric',
          'database_name' => 'required|string|max:50',
          'database_username' => 'required|string|max:50',
          'broadcast_driver' => 'required|string|max:50',
          'cache_driver' => 'required|string|max:50',
          'session_driver' => 'required|string|max:50',
          'queue_driver' => 'required|string|max:50',
          'redis_hostname' => 'required|string|max:50',
          'redis_password' => 'required|string|max:50',
          'redis_port' => 'required|numeric',
          'mail_driver' => 'required|string|max:50',
          'mail_host' => 'required|string|max:50',
          'mail_port' => 'required|string|max:50',
          'mail_username' => 'required|string|max:50',
          'mail_password' => 'required|string|max:50',
          'mail_encryption' => 'required|string|max:50',
          'pusher_app_id' => 'max:50',
          'pusher_app_key' => 'max:50',
          'pusher_app_secret' => 'max:50',
        ),
      ),
    ),
    'installed' => 
    array (
      'redirectOptions' => 
      array (
        'route' => 
        array (
          'name' => 'welcome',
          'data' => 
          array (
          ),
        ),
        'abort' => 
        array (
          'type' => '404',
        ),
        'dump' => 
        array (
          'data' => 'Dumping a not found message.',
        ),
      ),
    ),
    'installedAlreadyAction' => '',
    'updaterEnabled' => 'true',
  ),
  'landing' => 
  array (
    'item_url' => 'https://codecanyon.net/xx',
    'list_demo' => 
    array (
      0 => 
      array (
        'url' => 'https://www.bookingcore.org',
        'name' => 'Homepage',
        'thumb' => 'img/demo/home.png',
      ),
      1 => 
      array (
        'url' => 'https://www.bookingcore.org/tour',
        'name' => 'Tour Search',
        'thumb' => 'img/demo/tour.png',
      ),
      2 => 
      array (
        'url' => 'https://www.bookingcore.org/tour/paris-vacation-travel',
        'name' => 'Single Tour',
        'thumb' => 'img/demo/tour_single.png',
      ),
      3 => 
      array (
        'url' => 'https://www.bookingcore.org/tour?_layout=map',
        'name' => 'Search Map',
        'thumb' => 'img/demo/tour_map.png',
        'class' => 'col-lg-8 col-md-12 col-sm-12',
      ),
      4 => 
      array (
        'url' => 'https://www.bookingcore.org/news',
        'name' => 'Blog List',
        'thumb' => 'img/demo/news.png',
      ),
    ),
    'exclusive_features' => 
    array (
      0 => 
      array (
        'name' => 'Laravel 5.8',
        'desc' => 'Based of newest version of Laravel. The best popular PHP framework',
        'thumb' => 'img/plugin/laravel.png',
      ),
      1 => 
      array (
        'name' => 'Role Based Access Control',
        'desc' => 'Allow you add/modify roles to create many type of user',
        'thumb' => 'img/plugin/rbac.png',
      ),
      2 => 
      array (
        'name' => 'Image Optimization',
        'desc' => 'Built-in library that auto compress your photo when uploading',
        'thumb' => 'img/plugin/image-compress.png',
      ),
      3 => 
      array (
        'name' => 'Media Management',
        'desc' => 'Manager all your uploaded file',
        'thumb' => 'img/plugin/media.png',
      ),
      4 => 
      array (
        'name' => 'Menu & Page Builder',
        'desc' => 'Easy customize with cleaning code and well documented',
        'thumb' => 'img/plugin/code.png',
      ),
      5 => 
      array (
        'name' => 'Vendor System',
        'desc' => 'Allow you to build a booking marketplace system',
        'thumb' => 'img/plugin/vendor.png',
      ),
    ),
    'screenshots' => 
    array (
      0 => 
      array (
        'name' => 'Pricing <span>Rules</span>',
        'desc' => 'Various booking rules allow your customize the system.',
        'thumb' => 'img/feature/booking_rules.png',
      ),
      1 => 
      array (
        'name' => 'Site <span>Settings</span>',
        'desc' => 'Simple, easy options Information management. Flexible options will help you design the system in your own way.',
        'thumb' => 'img/feature/theme_option.png',
      ),
      2 => 
      array (
        'name' => 'Vendor <span>Dashboard</span>',
        'desc' => 'Simple, handy interface, easy to manage information, manage articles as well as manage revenue by Tour and Booking History with completed and pending status.',
        'thumb' => 'img/feature/tour_partner.png',
      ),
      3 => 
      array (
        'name' => 'Smart <span>Search</span>',
        'desc' => 'The vendor can create and manage their listings on the frontend by using the partner dashboard.<br>
The interface is simple and clear, the vendor who does not need experience on the website can also post the most easily',
        'thumb' => 'img/feature/add_listing.png',
      ),
      4 => 
      array (
        'name' => 'Template <span>Builder</span>',
        'desc' => 'Build your own page template with simple Template Builder.',
        'thumb' => 'img/feature/template-builder.png',
      ),
      5 => 
      array (
        'name' => 'Menu <span>Builder</span>',
        'desc' => 'Build your own menu with simple menu Builder.',
        'thumb' => 'img/feature/menu-builder.png',
      ),
    ),
    'other_features' => 
    array (
      0 => 
      array (
        'name' => 'Optimized code',
        'desc' => 'A preeminent advantage that pleases all potential developers, can transform from a simple to the most complex, most versatile system.',
        'thumb' => 'img/other/optimize.png',
        'type' => '',
      ),
      1 => 
      array (
        'name' => 'Booking Report',
        'desc' => 'Clear interface, detailed statistics chart, high logic will greatly support managers.',
        'thumb' => 'img/other/report.png',
        'type' => '',
      ),
      2 => 
      array (
        'name' => 'Fully Responsive',
        'desc' => 'Perfect Responsive is the most effective way to win customers. All information, images are presented clearly, neatly and cleanly.',
        'thumb' => 'img/other/responsive.png',
        'type' => '',
      ),
      3 => 
      array (
        'name' => 'Maximum speed rating',
        'desc' => 'One of Laravel\'s outstanding advantages is Speed, websites built on this platform never mind have to think about the problems of website speed optimization.',
        'thumb' => 'img/other/startup.png',
        'type' => '',
      ),
      4 => 
      array (
        'name' => 'Retina Ready',
        'desc' => 'All of the graphics in our theme are of high resolution to ensure that your website looks crisp on modern displays.',
        'thumb' => 'img/other/retina.svg',
        'type' => '',
      ),
      5 => 
      array (
        'name' => 'Make Review',
        'desc' => 'Make a review for all services, with some options, allows required booked or no need can make reviews.',
        'thumb' => 'img/other/review.svg',
        'type' => '',
      ),
      6 => 
      array (
        'name' => 'Social Login',
        'desc' => 'Integrated by built-ins with Google, Facebook login. Difference register form normal user and Partner / Vendor user.',
        'thumb' => 'img/other/social_login.svg',
        'type' => '',
      ),
      7 => 
      array (
        'name' => 'Support Location',
        'desc' => 'Support Location post type for build location structure by your way. Included lat & longtidule of Google Map.',
        'thumb' => 'img/other/location.svg',
        'type' => '',
      ),
      8 => 
      array (
        'name' => 'Translate tool built-in',
        'desc' => 'Tool compiled the built-in language, customers just follow the Document and personalize the text to suit their intended use.',
        'thumb' => 'img/other/language.png',
        'type' => '',
      ),
      9 => 
      array (
        'name' => 'Lazy Load',
        'desc' => 'Increase performance of your website with lazy load image.',
        'thumb' => 'img/other/speedometer.png',
        'type' => '',
      ),
      10 => 
      array (
        'name' => 'And Much More',
        'thumb' => 'img/other/more.svg',
        'type' => 'more',
      ),
    ),
  ),
  'languages' => 
  array (
    'locales' => 
    array (
      'ab' => 'Abkhazian',
      'ace' => 'Achinese',
      'ach' => 'Acoli',
      'ada' => 'Adangme',
      'ady' => 'Adyghe',
      'aa' => 'Afar',
      'afh' => 'Afrihili',
      'af' => 'Afrikaans',
      'agq' => 'Aghem',
      'ain' => 'Ainu',
      'ak' => 'Akan',
      'akk' => 'Akkadian',
      'bss' => 'Akoose',
      'akz' => 'Alabama',
      'sq' => 'Albanian',
      'ale' => 'Aleut',
      'arq' => 'Algerian Arabic',
      'en_US' => 'American English',
      'ase' => 'American Sign Language',
      'am' => 'Amharic',
      'egy' => 'Ancient Egyptian',
      'grc' => 'Ancient Greek',
      'anp' => 'Angika',
      'njo' => 'Ao Naga',
      'ar' => 'Arabic',
      'an' => 'Aragonese',
      'arc' => 'Aramaic',
      'aro' => 'Araona',
      'arp' => 'Arapaho',
      'arw' => 'Arawak',
      'hy' => 'Armenian',
      'rup' => 'Aromanian',
      'frp' => 'Arpitan',
      'as' => 'Assamese',
      'ast' => 'Asturian',
      'asa' => 'Asu',
      'cch' => 'Atsam',
      'en_AU' => 'Australian English',
      'de_AT' => 'Austrian German',
      'av' => 'Avaric',
      'ae' => 'Avestan',
      'awa' => 'Awadhi',
      'ay' => 'Aymara',
      'az' => 'Azerbaijani',
      'bfq' => 'Badaga',
      'ksf' => 'Bafia',
      'bfd' => 'Bafut',
      'bqi' => 'Bakhtiari',
      'ban' => 'Balinese',
      'bal' => 'Baluchi',
      'bm' => 'Bambara',
      'bax' => 'Bamun',
      'bjn' => 'Banjar',
      'bas' => 'Basaa',
      'ba' => 'Bashkir',
      'eu' => 'Basque',
      'bbc' => 'Batak Toba',
      'bar' => 'Bavarian',
      'bej' => 'Beja',
      'be' => 'Belarusian',
      'bem' => 'Bemba',
      'bez' => 'Bena',
      'bn' => 'Bengali',
      'bew' => 'Betawi',
      'bho' => 'Bhojpuri',
      'bik' => 'Bikol',
      'bin' => 'Bini',
      'bpy' => 'Bishnupriya',
      'bi' => 'Bislama',
      'byn' => 'Blin',
      'zbl' => 'Blissymbols',
      'brx' => 'Bodo',
      'bs' => 'Bosnian',
      'brh' => 'Brahui',
      'bra' => 'Braj',
      'pt_BR' => 'Brazilian Portuguese',
      'br' => 'Breton',
      'en_GB' => 'British English',
      'bug' => 'Buginese',
      'bg' => 'Bulgarian',
      'bum' => 'Bulu',
      'bua' => 'Buriat',
      'my' => 'Burmese',
      'cad' => 'Caddo',
      'frc' => 'Cajun French',
      'en_CA' => 'Canadian English',
      'fr_CA' => 'Canadian French',
      'yue' => 'Cantonese',
      'cps' => 'Capiznon',
      'car' => 'Carib',
      'ca' => 'Catalan',
      'cay' => 'Cayuga',
      'ceb' => 'Cebuano',
      'tzm' => 'Central Atlas Tamazight',
      'dtp' => 'Central Dusun',
      'ckb' => 'Central Kurdish',
      'esu' => 'Central Yupik',
      'shu' => 'Chadian Arabic',
      'chg' => 'Chagatai',
      'ch' => 'Chamorro',
      'ce' => 'Chechen',
      'chr' => 'Cherokee',
      'chy' => 'Cheyenne',
      'chb' => 'Chibcha',
      'cgg' => 'Chiga',
      'qug' => 'Chimborazo Highland Quichua',
      'zh' => 'Chinese',
      'chn' => 'Chinook Jargon',
      'chp' => 'Chipewyan',
      'cho' => 'Choctaw',
      'cu' => 'Church Slavic',
      'chk' => 'Chuukese',
      'cv' => 'Chuvash',
      'nwc' => 'Classical Newari',
      'syc' => 'Classical Syriac',
      'ksh' => 'Colognian',
      'swb' => 'Comorian',
      'swc' => 'Congo Swahili',
      'cop' => 'Coptic',
      'kw' => 'Cornish',
      'co' => 'Corsican',
      'cr' => 'Cree',
      'mus' => 'Creek',
      'crh' => 'Crimean Turkish',
      'hr' => 'Croatian',
      'cs' => 'Czech',
      'dak' => 'Dakota',
      'da' => 'Danish',
      'dar' => 'Dargwa',
      'dzg' => 'Dazaga',
      'del' => 'Delaware',
      'din' => 'Dinka',
      'dv' => 'Divehi',
      'doi' => 'Dogri',
      'dgr' => 'Dogrib',
      'dua' => 'Duala',
      'nl' => 'Dutch',
      'dyu' => 'Dyula',
      'dz' => 'Dzongkha',
      'frs' => 'Eastern Frisian',
      'efi' => 'Efik',
      'arz' => 'Egyptian Arabic',
      'eka' => 'Ekajuk',
      'elx' => 'Elamite',
      'ebu' => 'Embu',
      'egl' => 'Emilian',
      'en' => 'English',
      'myv' => 'Erzya',
      'eo' => 'Esperanto',
      'et' => 'Estonian',
      'pt_PT' => 'European Portuguese',
      'es_ES' => 'European Spanish',
      'ee' => 'Ewe',
      'ewo' => 'Ewondo',
      'ext' => 'Extremaduran',
      'fan' => 'Fang',
      'fat' => 'Fanti',
      'fo' => 'Faroese',
      'hif' => 'Fiji Hindi',
      'fj' => 'Fijian',
      'fil' => 'Filipino',
      'fi' => 'Finnish',
      'nl_BE' => 'Flemish',
      'fon' => 'Fon',
      'gur' => 'Frafra',
      'fr' => 'French',
      'fur' => 'Friulian',
      'ff' => 'Fulah',
      'gaa' => 'Ga',
      'gag' => 'Gagauz',
      'gl' => 'Galician',
      'gan' => 'Gan Chinese',
      'lg' => 'Ganda',
      'gay' => 'Gayo',
      'gba' => 'Gbaya',
      'gez' => 'Geez',
      'ka' => 'Georgian',
      'de' => 'German',
      'aln' => 'Gheg Albanian',
      'bbj' => 'Ghomala',
      'glk' => 'Gilaki',
      'gil' => 'Gilbertese',
      'gom' => 'Goan Konkani',
      'gon' => 'Gondi',
      'gor' => 'Gorontalo',
      'got' => 'Gothic',
      'grb' => 'Grebo',
      'el' => 'Greek',
      'gn' => 'Guarani',
      'gu' => 'Gujarati',
      'guz' => 'Gusii',
      'gwi' => 'Gwichʼin',
      'hai' => 'Haida',
      'ht' => 'Haitian',
      'hak' => 'Hakka Chinese',
      'ha' => 'Hausa',
      'haw' => 'Hawaiian',
      'he' => 'Hebrew',
      'hz' => 'Herero',
      'hil' => 'Hiligaynon',
      'hi' => 'Hindi',
      'ho' => 'Hiri Motu',
      'hit' => 'Hittite',
      'hmn' => 'Hmong',
      'hu' => 'Hungarian',
      'hup' => 'Hupa',
      'iba' => 'Iban',
      'ibb' => 'Ibibio',
      'is' => 'Icelandic',
      'io' => 'Ido',
      'ig' => 'Igbo',
      'ilo' => 'Iloko',
      'smn' => 'Inari Sami',
      'id' => 'Indonesian',
      'izh' => 'Ingrian',
      'inh' => 'Ingush',
      'ia' => 'Interlingua',
      'ie' => 'Interlingue',
      'iu' => 'Inuktitut',
      'ik' => 'Inupiaq',
      'ga' => 'Irish',
      'it' => 'Italian',
      'jam' => 'Jamaican Creole English',
      'ja' => 'Japanese',
      'jv' => 'Javanese',
      'kaj' => 'Jju',
      'dyo' => 'Jola-Fonyi',
      'jrb' => 'Judeo-Arabic',
      'jpr' => 'Judeo-Persian',
      'jut' => 'Jutish',
      'kbd' => 'Kabardian',
      'kea' => 'Kabuverdianu',
      'kab' => 'Kabyle',
      'kac' => 'Kachin',
      'kgp' => 'Kaingang',
      'kkj' => 'Kako',
      'kl' => 'Kalaallisut',
      'kln' => 'Kalenjin',
      'xal' => 'Kalmyk',
      'kam' => 'Kamba',
      'kbl' => 'Kanembu',
      'kn' => 'Kannada',
      'kr' => 'Kanuri',
      'kaa' => 'Kara-Kalpak',
      'krc' => 'Karachay-Balkar',
      'krl' => 'Karelian',
      'ks' => 'Kashmiri',
      'csb' => 'Kashubian',
      'kaw' => 'Kawi',
      'kk' => 'Kazakh',
      'ken' => 'Kenyang',
      'kha' => 'Khasi',
      'km' => 'Khmer',
      'kho' => 'Khotanese',
      'khw' => 'Khowar',
      'ki' => 'Kikuyu',
      'kmb' => 'Kimbundu',
      'krj' => 'Kinaray-a',
      'rw' => 'Kinyarwanda',
      'kiu' => 'Kirmanjki',
      'tlh' => 'Klingon',
      'bkm' => 'Kom',
      'kv' => 'Komi',
      'koi' => 'Komi-Permyak',
      'kg' => 'Kongo',
      'kok' => 'Konkani',
      'ko' => 'Korean',
      'kfo' => 'Koro',
      'kos' => 'Kosraean',
      'avk' => 'Kotava',
      'khq' => 'Koyra Chiini',
      'ses' => 'Koyraboro Senni',
      'kpe' => 'Kpelle',
      'kri' => 'Krio',
      'kj' => 'Kuanyama',
      'kum' => 'Kumyk',
      'ku' => 'Kurdish',
      'kru' => 'Kurukh',
      'kut' => 'Kutenai',
      'nmg' => 'Kwasio',
      'ky' => 'Kyrgyz',
      'quc' => 'Kʼicheʼ',
      'lad' => 'Ladino',
      'lah' => 'Lahnda',
      'lkt' => 'Lakota',
      'lam' => 'Lamba',
      'lag' => 'Langi',
      'lo' => 'Lao',
      'ltg' => 'Latgalian',
      'la' => 'Latin',
      'es_419' => 'Latin American Spanish',
      'lv' => 'Latvian',
      'lzz' => 'Laz',
      'lez' => 'Lezghian',
      'lij' => 'Ligurian',
      'li' => 'Limburgish',
      'ln' => 'Lingala',
      'lfn' => 'Lingua Franca Nova',
      'lzh' => 'Literary Chinese',
      'lt' => 'Lithuanian',
      'liv' => 'Livonian',
      'jbo' => 'Lojban',
      'lmo' => 'Lombard',
      'nds' => 'Low German',
      'sli' => 'Lower Silesian',
      'dsb' => 'Lower Sorbian',
      'loz' => 'Lozi',
      'lu' => 'Luba-Katanga',
      'lua' => 'Luba-Lulua',
      'lui' => 'Luiseno',
      'smj' => 'Lule Sami',
      'lun' => 'Lunda',
      'luo' => 'Luo',
      'lb' => 'Luxembourgish',
      'luy' => 'Luyia',
      'mde' => 'Maba',
      'mk' => 'Macedonian',
      'jmc' => 'Machame',
      'mad' => 'Madurese',
      'maf' => 'Mafa',
      'mag' => 'Magahi',
      'vmf' => 'Main-Franconian',
      'mai' => 'Maithili',
      'mak' => 'Makasar',
      'mgh' => 'Makhuwa-Meetto',
      'kde' => 'Makonde',
      'mg' => 'Malagasy',
      'ms' => 'Malay',
      'ml' => 'Malayalam',
      'mt' => 'Maltese',
      'mnc' => 'Manchu',
      'mdr' => 'Mandar',
      'man' => 'Mandingo',
      'mni' => 'Manipuri',
      'gv' => 'Manx',
      'mi' => 'Maori',
      'arn' => 'Mapuche',
      'mr' => 'Marathi',
      'chm' => 'Mari',
      'mh' => 'Marshallese',
      'mwr' => 'Marwari',
      'mas' => 'Masai',
      'mzn' => 'Mazanderani',
      'byv' => 'Medumba',
      'men' => 'Mende',
      'mwv' => 'Mentawai',
      'mer' => 'Meru',
      'mgo' => 'Metaʼ',
      'es_MX' => 'Mexican Spanish',
      'mic' => 'Micmac',
      'dum' => 'Middle Dutch',
      'enm' => 'Middle English',
      'frm' => 'Middle French',
      'gmh' => 'Middle High German',
      'mga' => 'Middle Irish',
      'nan' => 'Min Nan Chinese',
      'min' => 'Minangkabau',
      'xmf' => 'Mingrelian',
      'mwl' => 'Mirandese',
      'lus' => 'Mizo',
      'ar_001' => 'Modern Standard Arabic',
      'moh' => 'Mohawk',
      'mdf' => 'Moksha',
      'ro_MD' => 'Moldavian',
      'lol' => 'Mongo',
      'mn' => 'Mongolian',
      'mfe' => 'Morisyen',
      'ary' => 'Moroccan Arabic',
      'mos' => 'Mossi',
      'mul' => 'Multiple Languages',
      'mua' => 'Mundang',
      'ttt' => 'Muslim Tat',
      'mye' => 'Myene',
      'naq' => 'Nama',
      'na' => 'Nauru',
      'nv' => 'Navajo',
      'ng' => 'Ndonga',
      'nap' => 'Neapolitan',
      'ne' => 'Nepali',
      'new' => 'Newari',
      'sba' => 'Ngambay',
      'nnh' => 'Ngiemboon',
      'jgo' => 'Ngomba',
      'yrl' => 'Nheengatu',
      'nia' => 'Nias',
      'niu' => 'Niuean',
      'zxx' => 'No linguistic content',
      'nog' => 'Nogai',
      'nd' => 'North Ndebele',
      'frr' => 'Northern Frisian',
      'se' => 'Northern Sami',
      'nso' => 'Northern Sotho',
      'no' => 'Norwegian',
      'nb' => 'Norwegian Bokmål',
      'nn' => 'Norwegian Nynorsk',
      'nov' => 'Novial',
      'nus' => 'Nuer',
      'nym' => 'Nyamwezi',
      'ny' => 'Nyanja',
      'nyn' => 'Nyankole',
      'tog' => 'Nyasa Tonga',
      'nyo' => 'Nyoro',
      'nzi' => 'Nzima',
      'nqo' => 'NʼKo',
      'oc' => 'Occitan',
      'oj' => 'Ojibwa',
      'ang' => 'Old English',
      'fro' => 'Old French',
      'goh' => 'Old High German',
      'sga' => 'Old Irish',
      'non' => 'Old Norse',
      'peo' => 'Old Persian',
      'pro' => 'Old Provençal',
      'or' => 'Oriya',
      'om' => 'Oromo',
      'osa' => 'Osage',
      'os' => 'Ossetic',
      'ota' => 'Ottoman Turkish',
      'pal' => 'Pahlavi',
      'pfl' => 'Palatine German',
      'pau' => 'Palauan',
      'pi' => 'Pali',
      'pam' => 'Pampanga',
      'pag' => 'Pangasinan',
      'pap' => 'Papiamento',
      'ps' => 'Pashto',
      'pdc' => 'Pennsylvania German',
      'fa' => 'Persian',
      'phn' => 'Phoenician',
      'pcd' => 'Picard',
      'pms' => 'Piedmontese',
      'pdt' => 'Plautdietsch',
      'pon' => 'Pohnpeian',
      'pl' => 'Polish',
      'pnt' => 'Pontic',
      'pt' => 'Portuguese',
      'prg' => 'Prussian',
      'pa' => 'Punjabi',
      'qu' => 'Quechua',
      'raj' => 'Rajasthani',
      'rap' => 'Rapanui',
      'rar' => 'Rarotongan',
      'rif' => 'Riffian',
      'rgn' => 'Romagnol',
      'ro' => 'Romanian',
      'rm' => 'Romansh',
      'rom' => 'Romany',
      'rof' => 'Rombo',
      'root' => 'Root',
      'rtm' => 'Rotuman',
      'rug' => 'Roviana',
      'rn' => 'Rundi',
      'ru' => 'Russian',
      'rue' => 'Rusyn',
      'rwk' => 'Rwa',
      'ssy' => 'Saho',
      'sah' => 'Sakha',
      'sam' => 'Samaritan Aramaic',
      'saq' => 'Samburu',
      'sm' => 'Samoan',
      'sgs' => 'Samogitian',
      'sad' => 'Sandawe',
      'sg' => 'Sango',
      'sbp' => 'Sangu',
      'sa' => 'Sanskrit',
      'sat' => 'Santali',
      'sc' => 'Sardinian',
      'sas' => 'Sasak',
      'sdc' => 'Sassarese Sardinian',
      'stq' => 'Saterland Frisian',
      'saz' => 'Saurashtra',
      'sco' => 'Scots',
      'gd' => 'Scottish Gaelic',
      'sly' => 'Selayar',
      'sel' => 'Selkup',
      'seh' => 'Sena',
      'see' => 'Seneca',
      'sr' => 'Serbian',
      'sh' => 'Serbo-Croatian',
      'srr' => 'Serer',
      'sei' => 'Seri',
      'ksb' => 'Shambala',
      'shn' => 'Shan',
      'sn' => 'Shona',
      'ii' => 'Sichuan Yi',
      'scn' => 'Sicilian',
      'sid' => 'Sidamo',
      'bla' => 'Siksika',
      'szl' => 'Silesian',
      'zh_Hans' => 'Simplified Chinese',
      'sd' => 'Sindhi',
      'si' => 'Sinhala',
      'sms' => 'Skolt Sami',
      'den' => 'Slave',
      'sk' => 'Slovak',
      'sl' => 'Slovenian',
      'xog' => 'Soga',
      'sog' => 'Sogdien',
      'so' => 'Somali',
      'snk' => 'Soninke',
      'azb' => 'South Azerbaijani',
      'nr' => 'South Ndebele',
      'alt' => 'Southern Altai',
      'sma' => 'Southern Sami',
      'st' => 'Southern Sotho',
      'es' => 'Spanish',
      'srn' => 'Sranan Tongo',
      'zgh' => 'Standard Moroccan Tamazight',
      'suk' => 'Sukuma',
      'sux' => 'Sumerian',
      'su' => 'Sundanese',
      'sus' => 'Susu',
      'sw' => 'Swahili',
      'ss' => 'Swati',
      'sv' => 'Swedish',
      'fr_CH' => 'Swiss French',
      'gsw' => 'Swiss German',
      'de_CH' => 'Swiss High German',
      'syr' => 'Syriac',
      'shi' => 'Tachelhit',
      'tl' => 'Tagalog',
      'ty' => 'Tahitian',
      'dav' => 'Taita',
      'tg' => 'Tajik',
      'tly' => 'Talysh',
      'tmh' => 'Tamashek',
      'ta' => 'Tamil',
      'trv' => 'Taroko',
      'twq' => 'Tasawaq',
      'tt' => 'Tatar',
      'te' => 'Telugu',
      'ter' => 'Tereno',
      'teo' => 'Teso',
      'tet' => 'Tetum',
      'th' => 'Thai',
      'bo' => 'Tibetan',
      'tig' => 'Tigre',
      'ti' => 'Tigrinya',
      'tem' => 'Timne',
      'tiv' => 'Tiv',
      'tli' => 'Tlingit',
      'tpi' => 'Tok Pisin',
      'tkl' => 'Tokelau',
      'to' => 'Tongan',
      'fit' => 'Tornedalen Finnish',
      'zh_Hant' => 'Traditional Chinese',
      'tkr' => 'Tsakhur',
      'tsd' => 'Tsakonian',
      'tsi' => 'Tsimshian',
      'ts' => 'Tsonga',
      'tn' => 'Tswana',
      'tcy' => 'Tulu',
      'tum' => 'Tumbuka',
      'aeb' => 'Tunisian Arabic',
      'tr' => 'Turkish',
      'tk' => 'Turkmen',
      'tru' => 'Turoyo',
      'tvl' => 'Tuvalu',
      'tyv' => 'Tuvinian',
      'tw' => 'Twi',
      'kcg' => 'Tyap',
      'udm' => 'Udmurt',
      'uga' => 'Ugaritic',
      'uk' => 'Ukrainian',
      'umb' => 'Umbundu',
      'und' => 'Unknown Language',
      'hsb' => 'Upper Sorbian',
      'ur' => 'Urdu',
      'ug' => 'Uyghur',
      'uz' => 'Uzbek',
      'vai' => 'Vai',
      've' => 'Venda',
      'vec' => 'Venetian',
      'vep' => 'Veps',
      'vi' => 'Vietnamese',
      'vo' => 'Volapük',
      'vro' => 'Võro',
      'vot' => 'Votic',
      'vun' => 'Vunjo',
      'wa' => 'Walloon',
      'wae' => 'Walser',
      'war' => 'Waray',
      'wbp' => 'Warlpiri',
      'was' => 'Washo',
      'guc' => 'Wayuu',
      'cy' => 'Welsh',
      'vls' => 'West Flemish',
      'fy' => 'Western Frisian',
      'mrj' => 'Western Mari',
      'wal' => 'Wolaytta',
      'wo' => 'Wolof',
      'wuu' => 'Wu Chinese',
      'xh' => 'Xhosa',
      'hsn' => 'Xiang Chinese',
      'yav' => 'Yangben',
      'yao' => 'Yao',
      'yap' => 'Yapese',
      'ybb' => 'Yemba',
      'yi' => 'Yiddish',
      'yo' => 'Yoruba',
      'zap' => 'Zapotec',
      'dje' => 'Zarma',
      'zza' => 'Zaza',
      'zea' => 'Zeelandic',
      'zen' => 'Zenaga',
      'za' => 'Zhuang',
      'gbz' => 'Zoroastrian Dari',
      'zu' => 'Zulu',
      'zun' => 'Zuni',
    ),
  ),
  'location' => 
  array (
    'location_route_prefix' => 'location',
  ),
  'logging' => 
  array (
    'default' => 'stack',
    'channels' => 
    array (
      'stack' => 
      array (
        'driver' => 'stack',
        'channels' => 
        array (
          0 => 'daily',
        ),
        'ignore_exceptions' => false,
      ),
      'single' => 
      array (
        'driver' => 'single',
        'path' => '/opt/lampp/htdocs/booking8/storage/logs/laravel.log',
        'level' => 'debug',
      ),
      'daily' => 
      array (
        'driver' => 'daily',
        'path' => '/opt/lampp/htdocs/booking8/storage/logs/laravel.log',
        'level' => 'debug',
        'days' => 14,
      ),
      'slack' => 
      array (
        'driver' => 'slack',
        'url' => NULL,
        'username' => 'Laravel Log',
        'emoji' => ':boom:',
        'level' => 'critical',
      ),
      'papertrail' => 
      array (
        'driver' => 'monolog',
        'level' => 'debug',
        'handler' => 'Monolog\\Handler\\SyslogUdpHandler',
        'handler_with' => 
        array (
          'host' => NULL,
          'port' => NULL,
        ),
      ),
      'stderr' => 
      array (
        'driver' => 'monolog',
        'handler' => 'Monolog\\Handler\\StreamHandler',
        'formatter' => NULL,
        'with' => 
        array (
          'stream' => 'php://stderr',
        ),
      ),
      'syslog' => 
      array (
        'driver' => 'syslog',
        'level' => 'debug',
      ),
      'errorlog' => 
      array (
        'driver' => 'errorlog',
        'level' => 'debug',
      ),
    ),
  ),
  'mail' => 
  array (
    'driver' => 'log',
    'host' => 'smtp.mailtrap.io',
    'port' => '587',
    'from' => 
    array (
      'address' => 'hello@example.com',
      'name' => 'Example',
    ),
    'encryption' => 'tls',
    'username' => NULL,
    'password' => NULL,
    'sendmail' => '/usr/sbin/sendmail -bs',
    'markdown' => 
    array (
      'theme' => 'default',
      'paths' => 
      array (
        0 => '/opt/lampp/htdocs/booking8/resources/views/vendor/mail',
      ),
    ),
    'log_channel' => NULL,
  ),
  'mapengine' => 
  array (
    'openstreetmap' => 
    array (
      'script' => 'https://www.facebook.com/scotchdevelopment',
    ),
    'googlemap' => 
    array (
      'script' => 'https://www.facebook.com/scotchdevelopment',
    ),
  ),
  'modules' => 
  array (
    'namespace' => 'Plugins',
    'stubs' => 
    array (
      'enabled' => false,
      'path' => '/opt/lampp/htdocs/booking8/vendor/nwidart/laravel-modules/src/Commands/stubs',
      'files' => 
      array (
        'routes/web' => 'Routes/web.php',
        'routes/api' => 'Routes/api.php',
        'views/index' => 'Resources/views/index.blade.php',
        'views/master' => 'Resources/views/layouts/master.blade.php',
        'scaffold/config' => 'Config/config.php',
        'composer' => 'composer.json',
        'assets/js/app' => 'Resources/assets/js/app.js',
        'assets/sass/app' => 'Resources/assets/sass/app.scss',
        'webpack' => 'webpack.mix.js',
        'package' => 'package.json',
      ),
      'replacements' => 
      array (
        'routes/web' => 
        array (
          0 => 'LOWER_NAME',
          1 => 'STUDLY_NAME',
        ),
        'routes/api' => 
        array (
          0 => 'LOWER_NAME',
        ),
        'webpack' => 
        array (
          0 => 'LOWER_NAME',
        ),
        'json' => 
        array (
          0 => 'LOWER_NAME',
          1 => 'STUDLY_NAME',
          2 => 'MODULE_NAMESPACE',
        ),
        'views/index' => 
        array (
          0 => 'LOWER_NAME',
        ),
        'views/master' => 
        array (
          0 => 'LOWER_NAME',
          1 => 'STUDLY_NAME',
        ),
        'scaffold/config' => 
        array (
          0 => 'STUDLY_NAME',
        ),
        'composer' => 
        array (
          0 => 'LOWER_NAME',
          1 => 'STUDLY_NAME',
          2 => 'VENDOR',
          3 => 'AUTHOR_NAME',
          4 => 'AUTHOR_EMAIL',
          5 => 'MODULE_NAMESPACE',
        ),
      ),
      'gitkeep' => true,
    ),
    'paths' => 
    array (
      'modules' => '/opt/lampp/htdocs/booking8/plugins',
      'assets' => '/opt/lampp/htdocs/booking8/public/plugins',
      'migration' => '/opt/lampp/htdocs/booking8/database/migrations',
      'generator' => 
      array (
        'config' => 
        array (
          'path' => 'Config',
          'generate' => true,
        ),
        'command' => 
        array (
          'path' => 'Console',
          'generate' => true,
        ),
        'migration' => 
        array (
          'path' => 'Database/Migrations',
          'generate' => true,
        ),
        'seeder' => 
        array (
          'path' => 'Database/Seeders',
          'generate' => true,
        ),
        'factory' => 
        array (
          'path' => 'Database/factories',
          'generate' => true,
        ),
        'model' => 
        array (
          'path' => 'Entities',
          'generate' => true,
        ),
        'controller' => 
        array (
          'path' => 'Http/Controllers',
          'generate' => true,
        ),
        'filter' => 
        array (
          'path' => 'Http/Middleware',
          'generate' => true,
        ),
        'request' => 
        array (
          'path' => 'Http/Requests',
          'generate' => true,
        ),
        'provider' => 
        array (
          'path' => 'Providers',
          'generate' => true,
        ),
        'assets' => 
        array (
          'path' => 'Resources/assets',
          'generate' => true,
        ),
        'lang' => 
        array (
          'path' => 'Resources/lang',
          'generate' => true,
        ),
        'views' => 
        array (
          'path' => 'Resources/views',
          'generate' => true,
        ),
        'test' => 
        array (
          'path' => 'Tests/Unit',
          'generate' => true,
        ),
        'test-feature' => 
        array (
          'path' => 'Tests/Feature',
          'generate' => true,
        ),
        'repository' => 
        array (
          'path' => 'Repositories',
          'generate' => false,
        ),
        'event' => 
        array (
          'path' => 'Events',
          'generate' => false,
        ),
        'listener' => 
        array (
          'path' => 'Listeners',
          'generate' => false,
        ),
        'policies' => 
        array (
          'path' => 'Policies',
          'generate' => false,
        ),
        'rules' => 
        array (
          'path' => 'Rules',
          'generate' => false,
        ),
        'jobs' => 
        array (
          'path' => 'Jobs',
          'generate' => false,
        ),
        'emails' => 
        array (
          'path' => 'Emails',
          'generate' => false,
        ),
        'notifications' => 
        array (
          'path' => 'Notifications',
          'generate' => false,
        ),
        'resource' => 
        array (
          'path' => 'Transformers',
          'generate' => false,
        ),
      ),
    ),
    'scan' => 
    array (
      'enabled' => false,
      'paths' => 
      array (
        0 => '/opt/lampp/htdocs/booking8/vendor/*/*',
      ),
    ),
    'composer' => 
    array (
      'vendor' => 'bookingcore',
      'author' => 
      array (
        'name' => 'BookingCore',
        'email' => 'bookingcore.org@gmail.com',
      ),
    ),
    'cache' => 
    array (
      'enabled' => false,
      'key' => 'laravel-modules',
      'lifetime' => 60,
    ),
    'register' => 
    array (
      'translations' => true,
      'files' => 'register',
    ),
  ),
  'news' => 
  array (
    'news_route_prefix' => 'news',
    'news_category_route_prefix' => 'category',
    'news_tag_route_prefix' => 'tag',
  ),
  'page' => 
  array (
    'page_route_prefix' => 'page',
  ),
  'permission' => 
  array (
    'models' => 
    array (
      'permission' => 'Spatie\\Permission\\Models\\Permission',
      'role' => 'Spatie\\Permission\\Models\\Role',
    ),
    'table_names' => 
    array (
      'roles' => 'core_roles',
      'permissions' => 'core_permissions',
      'model_has_permissions' => 'core_model_has_permissions',
      'model_has_roles' => 'core_model_has_roles',
      'role_has_permissions' => 'core_role_has_permissions',
    ),
    'column_names' => 
    array (
      'model_morph_key' => 'model_id',
    ),
    'display_permission_in_exception' => false,
    'cache' => 
    array (
      'expiration_time' => 
      DateInterval::__set_state(array(
         'y' => 0,
         'm' => 0,
         'd' => 0,
         'h' => 24,
         'i' => 0,
         's' => 0,
         'f' => 0.0,
         'weekday' => 0,
         'weekday_behavior' => 0,
         'first_last_day_of' => 0,
         'invert' => 0,
         'days' => false,
         'special_type' => 0,
         'special_amount' => 0,
         'have_weekday_relative' => 0,
         'have_special_relative' => 0,
      )),
      'key' => 'spatie.permission.cache',
      'model_key' => 'name',
      'store' => 'default',
    ),
  ),
  'post_types' => 
  array (
    'news' => 'Modules\\News\\Models\\News',
    'news_category' => 'Modules\\News\\Models\\NewsCategory',
    'page' => 'Modules\\Page\\Models\\Page',
    'tour' => 'Modules\\Tour\\Models\\Tour',
    'tour_category' => 'Modules\\Tour\\Models\\TourCategory',
    'location' => 'Modules\\Location\\Models\\Location',
  ),
  'purifier' => 
  array (
    'encoding' => 'UTF-8',
    'finalize' => true,
    'cachePath' => '/opt/lampp/htdocs/booking8/storage/app/purifier',
    'cacheFileMode' => 493,
    'settings' => 
    array (
      'default' => 
      array (
        'HTML.Doctype' => 'HTML 4.01 Transitional',
        'HTML.Allowed' => 'div,b,strong,i,em,u,a[href|title],ul,ol,li,p[style],br,span[style],img[width|height|alt|src]',
        'CSS.AllowedProperties' => 'font,font-size,font-weight,font-style,font-family,text-decoration,padding-left,color,background-color,text-align',
        'AutoFormat.AutoParagraph' => true,
        'AutoFormat.RemoveEmpty' => true,
      ),
      'test' => 
      array (
        'Attr.EnableID' => 'true',
      ),
      'youtube' => 
      array (
        'HTML.SafeIframe' => 'true',
        'URI.SafeIframeRegexp' => '%^(http://|https://|//)(www.youtube.com/embed/|player.vimeo.com/video/)%',
      ),
      'custom_definition' => 
      array (
        'id' => 'html5-definitions',
        'rev' => 1,
        'debug' => false,
        'elements' => 
        array (
          0 => 
          array (
            0 => 'section',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          1 => 
          array (
            0 => 'nav',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          2 => 
          array (
            0 => 'article',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          3 => 
          array (
            0 => 'aside',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          4 => 
          array (
            0 => 'header',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          5 => 
          array (
            0 => 'footer',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          6 => 
          array (
            0 => 'address',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
          ),
          7 => 
          array (
            0 => 'hgroup',
            1 => 'Block',
            2 => 'Required: h1 | h2 | h3 | h4 | h5 | h6',
            3 => 'Common',
          ),
          8 => 
          array (
            0 => 'figure',
            1 => 'Block',
            2 => 'Optional: (figcaption, Flow) | (Flow, figcaption) | Flow',
            3 => 'Common',
          ),
          9 => 
          array (
            0 => 'figcaption',
            1 => 'Inline',
            2 => 'Flow',
            3 => 'Common',
          ),
          10 => 
          array (
            0 => 'video',
            1 => 'Block',
            2 => 'Optional: (source, Flow) | (Flow, source) | Flow',
            3 => 'Common',
            4 => 
            array (
              'src' => 'URI',
              'type' => 'Text',
              'width' => 'Length',
              'height' => 'Length',
              'poster' => 'URI',
              'preload' => 'Enum#auto,metadata,none',
              'controls' => 'Bool',
            ),
          ),
          11 => 
          array (
            0 => 'source',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
            4 => 
            array (
              'src' => 'URI',
              'type' => 'Text',
            ),
          ),
          12 => 
          array (
            0 => 's',
            1 => 'Inline',
            2 => 'Inline',
            3 => 'Common',
          ),
          13 => 
          array (
            0 => 'var',
            1 => 'Inline',
            2 => 'Inline',
            3 => 'Common',
          ),
          14 => 
          array (
            0 => 'sub',
            1 => 'Inline',
            2 => 'Inline',
            3 => 'Common',
          ),
          15 => 
          array (
            0 => 'sup',
            1 => 'Inline',
            2 => 'Inline',
            3 => 'Common',
          ),
          16 => 
          array (
            0 => 'mark',
            1 => 'Inline',
            2 => 'Inline',
            3 => 'Common',
          ),
          17 => 
          array (
            0 => 'wbr',
            1 => 'Inline',
            2 => 'Empty',
            3 => 'Core',
          ),
          18 => 
          array (
            0 => 'ins',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
            4 => 
            array (
              'cite' => 'URI',
              'datetime' => 'CDATA',
            ),
          ),
          19 => 
          array (
            0 => 'del',
            1 => 'Block',
            2 => 'Flow',
            3 => 'Common',
            4 => 
            array (
              'cite' => 'URI',
              'datetime' => 'CDATA',
            ),
          ),
        ),
        'attributes' => 
        array (
          0 => 
          array (
            0 => 'iframe',
            1 => 'allowfullscreen',
            2 => 'Bool',
          ),
          1 => 
          array (
            0 => 'table',
            1 => 'height',
            2 => 'Text',
          ),
          2 => 
          array (
            0 => 'td',
            1 => 'border',
            2 => 'Text',
          ),
          3 => 
          array (
            0 => 'th',
            1 => 'border',
            2 => 'Text',
          ),
          4 => 
          array (
            0 => 'tr',
            1 => 'width',
            2 => 'Text',
          ),
          5 => 
          array (
            0 => 'tr',
            1 => 'height',
            2 => 'Text',
          ),
          6 => 
          array (
            0 => 'tr',
            1 => 'border',
            2 => 'Text',
          ),
        ),
      ),
      'custom_attributes' => 
      array (
        0 => 
        array (
          0 => 'a',
          1 => 'target',
          2 => 'Enum#_blank,_self,_target,_top',
        ),
      ),
      'custom_elements' => 
      array (
        0 => 
        array (
          0 => 'u',
          1 => 'Inline',
          2 => 'Inline',
          3 => 'Common',
        ),
      ),
    ),
  ),
  'queue' => 
  array (
    'default' => 'sync',
    'connections' => 
    array (
      'sync' => 
      array (
        'driver' => 'sync',
      ),
      'database' => 
      array (
        'driver' => 'database',
        'table' => 'jobs',
        'queue' => 'default',
        'retry_after' => 90,
      ),
      'beanstalkd' => 
      array (
        'driver' => 'beanstalkd',
        'host' => 'localhost',
        'queue' => 'default',
        'retry_after' => 90,
        'block_for' => 0,
      ),
      'sqs' => 
      array (
        'driver' => 'sqs',
        'key' => NULL,
        'secret' => NULL,
        'prefix' => 'https://sqs.us-east-1.amazonaws.com/your-account-id',
        'queue' => 'your-queue-name',
        'region' => 'us-east-1',
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'default',
        'queue' => 'default',
        'retry_after' => 90,
        'block_for' => NULL,
      ),
    ),
    'failed' => 
    array (
      'database' => 'mysql',
      'table' => 'failed_jobs',
    ),
  ),
  'services' => 
  array (
    'mailgun' => 
    array (
      'domain' => NULL,
      'secret' => NULL,
      'endpoint' => 'api.mailgun.net',
    ),
    'postmark' => 
    array (
      'token' => NULL,
    ),
    'ses' => 
    array (
      'key' => NULL,
      'secret' => NULL,
      'region' => 'us-east-1',
    ),
    'sparkpost' => 
    array (
      'secret' => NULL,
    ),
    'stripe' => 
    array (
      'model' => 'App\\User',
      'key' => NULL,
      'secret' => NULL,
      'webhook' => 
      array (
        'secret' => NULL,
        'tolerance' => 300,
      ),
    ),
  ),
  'session' => 
  array (
    'driver' => 'file',
    'lifetime' => 120,
    'expire_on_close' => false,
    'encrypt' => false,
    'files' => '/opt/lampp/htdocs/booking8/storage/framework/sessions',
    'connection' => NULL,
    'table' => 'sessions',
    'store' => NULL,
    'lottery' => 
    array (
      0 => 2,
      1 => 100,
    ),
    'cookie' => 'laravel_session',
    'path' => '/',
    'domain' => NULL,
    'secure' => false,
    'http_only' => true,
    'same_site' => NULL,
  ),
  'template' => 
  array (
    'blocks' => 
    array (
      'text' => '\\Modules\\Template\\Blocks\\Text',
      'list_tours' => '\\Modules\\Tour\\Blocks\\ListTours',
      'form_search_tour' => '\\Modules\\Tour\\Blocks\\FormSearchTour',
      'list_featured_item' => '\\Modules\\Tour\\Blocks\\ListFeaturedItem',
      'testimonial' => '\\Modules\\Tour\\Blocks\\Testimonial',
      'call_to_action' => '\\Modules\\Tour\\Blocks\\CallToAction',
      'list_locations' => '\\Modules\\Location\\Blocks\\ListLocations',
    ),
  ),
  'tour' => 
  array (
    'tour_route_prefix' => 'tour',
  ),
  'view' => 
  array (
    'paths' => 
    array (
      0 => '/opt/lampp/htdocs/booking8/resources/views',
    ),
    'compiled' => '/opt/lampp/htdocs/booking8/storage/framework/views',
  ),
  'debug-server' => 
  array (
    'host' => 'tcp://127.0.0.1:9912',
  ),
  'excel' => 
  array (
    'exports' => 
    array (
      'chunk_size' => 1000,
      'pre_calculate_formulas' => false,
      'csv' => 
      array (
        'delimiter' => ',',
        'enclosure' => '"',
        'line_ending' => '
',
        'use_bom' => false,
        'include_separator_line' => false,
        'excel_compatibility' => false,
      ),
    ),
    'imports' => 
    array (
      'read_only' => true,
      'heading_row' => 
      array (
        'formatter' => 'slug',
      ),
      'csv' => 
      array (
        'delimiter' => ',',
        'enclosure' => '"',
        'escape_character' => '\\',
        'contiguous' => false,
        'input_encoding' => 'UTF-8',
      ),
    ),
    'extension_detector' => 
    array (
      'xlsx' => 'Xlsx',
      'xlsm' => 'Xlsx',
      'xltx' => 'Xlsx',
      'xltm' => 'Xlsx',
      'xls' => 'Xls',
      'xlt' => 'Xls',
      'ods' => 'Ods',
      'ots' => 'Ods',
      'slk' => 'Slk',
      'xml' => 'Xml',
      'gnumeric' => 'Gnumeric',
      'htm' => 'Html',
      'html' => 'Html',
      'csv' => 'Csv',
      'tsv' => 'Csv',
      'pdf' => 'Dompdf',
    ),
    'value_binder' => 
    array (
      'default' => 'Maatwebsite\\Excel\\DefaultValueBinder',
    ),
    'transactions' => 
    array (
      'handler' => 'db',
    ),
    'temporary_files' => 
    array (
      'local_path' => '/tmp',
      'remote_disk' => NULL,
      'remote_prefix' => NULL,
    ),
  ),
  'trustedproxy' => 
  array (
    'proxies' => NULL,
    'headers' => 30,
  ),
  'space' => 
  array (
    'name' => 'Space',
    'admin_menu' => 
    array (
    ),
  ),
  'tinker' => 
  array (
    'commands' => 
    array (
    ),
    'dont_alias' => 
    array (
      0 => 'App\\Nova',
    ),
  ),
);
