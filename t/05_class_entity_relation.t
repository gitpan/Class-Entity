use Test::More qw(no_plan);

BEGIN { use_ok(Class::Entity) }

package Class::Entity::Test;
use base qw(Class::Entity);

package Class::Entity::MyTest;
use base qw(Class::Entity);
sub _relation { "myrelation" }

package main;

cmp_ok(Class::Entity::Test->new->_relation, "eq",
  "* from " . Class::Entity::Test->_table,
  "static method call to _relation");

my $test = Class::Entity::Test;
cmp_ok($test->_relation, "eq", "* from " . $test->_table,
  "object method call to _relation");

cmp_ok(Class::Entity::MyTest->new->_relation, "eq", "myrelation",
  "overloaded static method call to _relation");

my $mytest = Class::Entity::MyTest;
cmp_ok($mytest->_relation, "eq", "myrelation",
  "overloaded object method call to _relation");

