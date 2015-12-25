<?php
$path = '/vagrant/*';
$ctags = '/usr/bin/ctags';

foreach (glob("$path", GLOB_ONLYDIR) as $dir) {
	exec("$ctags -f $dir/tags -R $dir");
}
