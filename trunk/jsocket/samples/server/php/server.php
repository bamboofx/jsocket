<?php
include('phpsocketdaemon/socket.php');
include 'FlashServer.php';
include 'PolicyServer.php';
set_time_limit(0);

$daemon = new socketDaemon();
$server = $daemon->create_server('PolicyServer', 'PolicyServerClient', '0.0.0.0', 843);
$server = $daemon->create_server('FlashServer', 'FlashServerClient', '0.0.0.0', 5011);
echo 'Server started!';
$daemon->process();
