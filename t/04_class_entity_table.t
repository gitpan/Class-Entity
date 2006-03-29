use Test::More qw(no_plan);

BEGIN { use_ok(Class::Entity) }

package Class::Entity::Test;
use base qw(Class::Entity);

package Class::Entity::MyTest;
use base qw(Class::Entity);
sub _table { "mytable" }

package main;

cmp_ok(Class::Entity::Test->new->_table, "eq", "Test",
  "static method call to _table");

my $test = Class::Entity::Test;
cmp_ok($test->_table, "eq", "Test",
  "object method call to _table");

cmp_ok(Class::Entity::MyTest->new->_table, "eq", "mytable",
  "overloaded static method call to _table");

my $mytest = Class::Entity::MyTest;
cmp_ok($mytest->_table, "eq", "mytable",
  "overloaded object method call to _table");

