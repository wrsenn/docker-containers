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
  'session' => 
  array (
    'save' => 'files',
  ),
  'resource' => 
  array (
    'default_setup' => 
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'MAGE_MODE' => 'default',
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
  ),
  'install' => 
  array (
    'date' => 'Fri, 21 Dec 2012 00:00:00 +0000',
  ),
);
