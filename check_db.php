<?php
$config = include 'application/database.php';
try {
    $dsn = "mysql:host={$config['hostname']};dbname={$config['database']};charset={$config['charset']}";
    $db = new PDO($dsn, $config['username'], $config['password']);
    
    // 获取游客组 (ID=1) 的权限
    $stmt = $db->query("SELECT * FROM mac_group WHERE group_id = 1");
    $group = $stmt->fetch(PDO::FETCH_ASSOC);
    
    file_put_contents('db_debug.txt', print_r($group, true));
    
    // 尝试更新权限，允许所有模块的访问
    // group_popedom 字段存储了权限，通常是逗号分隔的 ID
    // 在 MacCMS V10 中，如果这个字段包含对应的权限 ID，则允许访问
    // 简单起见，我们可以尝试把一些常见的权限加上
    // 但由于不知道具体的 ID，我们先看看现有的数据
} catch (Exception $e) {
    file_put_contents('db_debug.txt', $e->getMessage());
}
