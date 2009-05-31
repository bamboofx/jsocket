<?php
include 'FlashServerClient.php';
set_time_limit(0);

$daemon = new socketDaemon();
$server = $daemon->create_server('FlashServer', 'FlashServerClient', '0.0.0.0', 5011);
echo 'Server started!';
$daemon->process();
