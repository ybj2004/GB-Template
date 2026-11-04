use Cwd 'abs_path';
my $project_root = abs_path('.');
$makeindex = 'python "' . $project_root . '/buildindex.py" %R %D %S';
