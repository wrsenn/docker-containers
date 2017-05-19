<?php
return array (
  'backend' => 
  array (
    'frontName' => 'admin',
  ),
  'queue' => 
  array (
    'amqp' => 
    array (
      'host' => '',
      'port' => '',
      'user' => '',
      'password' => '',
      'virtualhost' => '/',
      'ssl' => '',
    ),
  ),
  'db' => 
  array (
    'connection' => 
    array (
      'indexer' => 
      array (
        'host' => 'mysql-host',
        'dbname' => 'magento',
        'username' => 'root',
        'password' => 'root',
        'model' => 'mysql4',
        'engine' => 'innodb',
        'initStatements' => 'SET NAMES utf8;',
        'active' => '1',
        'persistent' => NULL,
      ),
      'default' => 
      array (
        'host' => 'mysql-host',
        'dbname' => 'magento',
        'username' => 'root',
        'password' => 'root',
        'model' => 'mysql4',
        'engine' => 'innodb',
        'initStatements' => 'SET NAMES utf8;',
        'active' => '1',
      ),
    ),
    'table_prefix' => '',
  ),
  'crypt' => 
  array (
    'key' => 'nothing_to_see_here',
  ),
  'cache' => 
  array (
    'frontend' => 
    array (
      'default' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => 'redis-host',
          'database' => '0',
          'port' => '6379',
        ),
      ),
      'page_cache' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => 'redis-host',
          'port' => '6379',
          'database' => '1',
          'compress_data' => '1',
        ),
      ),
    ),
  ),
  'session' => 
  array (
    'save' => 'redis',
    'redis' => 
    array (
      'host' => 'redis-host',
      'port' => '6379',
      'password' => '',
      'timeout' => '2.5',
      'persistent_identifier' => '',
      'database' => '2',
      'compression_threshold' => '2048',
      'compression_library' => 'gzip',
      'log_level' => '1',
      'max_concurrency' => '6',
      'break_after_frontend' => '5',
      'break_after_adminhtml' => '30',
      'first_lifetime' => '600',
      'bot_first_lifetime' => '60',
      'bot_lifetime' => '7200',
      'disable_locking' => '0',
      'min_lifetime' => '60',
      'max_lifetime' => '2592000',
    ),
  ),
  'resource' => 
  array (
    'default_setup' => 
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'MAGE_MODE' => 'developer',
  'cache_types' => 
  array (
    'config' => 1,
    'layout' => 1,
    'block_html' => 1,
    'collections' => 1,
    'reflection' => 1,
    'db_ddl' => 1,
    'eav' => 1,
    'customer_notification' => 1,
    'target_rule' => 1,
    'full_page' => 1,
    'config_integration' => 1,
    'config_integration_api' => 1,
    'translate' => 1,
    'config_webservice' => 1,
    'subscribe_pro_config' => 1,
    'subscribe_pro_products' => 1,
    'compiled_config' => 1,
  ),
  'install' => 
  array (
    'date' => 'Fri, 21 Dec 2012 00:00:00 +0000',
  ),
);
