<?php
define('APP_PATH', __DIR__ . '/application/');
require __DIR__ . '/thinkphp/base.php';
use think\Db;
use think\Config;

// 加载数据库配置
$dbConfig = include APP_PATH . 'database.php';
Config::set('database', $dbConfig);

try {
    $prefix = $dbConfig['prefix'];
    $table = $prefix . 'user';
    
    // Check if columns exist
    $columns = Db::getFields($table);
    
    if (!isset($columns['user_openid_google'])) {
        Db::execute("ALTER TABLE `{$table}` ADD COLUMN `user_openid_google` varchar(50) DEFAULT '' AFTER `user_openid_weixin` ");
        echo "Added user_openid_google column.\n";
    } else {
        echo "user_openid_google column already exists.\n";
    }
    
    if (!isset($columns['user_openid_facebook'])) {
        Db::execute("ALTER TABLE `{$table}` ADD COLUMN `user_openid_facebook` varchar(50) DEFAULT '' AFTER `user_openid_google` ");
        echo "Added user_openid_facebook column.\n";
    } else {
        echo "user_openid_facebook column already exists.\n";
    }
    
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
