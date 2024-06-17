package Rust::mysql;

# This file is automatically generated by plbindgen.
# Changes to this file will be lost if it is regenerated.

use FFI::Platypus 2.00;
use FFI::Platypus::Lang::C;
use FFI::Platypus::Lang::Rust;
use FFI::CheckLib qw( find_lib_or_die );
use File::Basename qw( dirname );
use Exporter qw( import );

our @EXPORT = qw( );
our %EXPORT_TAGS = ( all => \@EXPORT );

BEGIN {
    # FIXME: FFI::Platypus::Lang::Rust doesn't have enum.
    my $c_map = FFI::Platypus::Lang::C->native_type_map;
    my $rust_map = FFI::Platypus::Lang::Rust->native_type_map;
    $rust_map->{$_} = $c_map->{$_} for 'enum', 'senum';
    *FFI::Platypus::Lang::Rust::native_type_map = sub { $rust_map };
}

our $VERSION = '0.1.0';

use Rust::mysql::Error;


my $ffi = FFI::Platypus->new( api => 2, lang => 'Rust' );
$ffi->bundle;


$ffi->type(enum => 'ErrorCode');

use constant NoError => 0;
use constant Utf8Error => 1;
use constant UrlError => 2;
use constant ConnectionError => 3;
use constant PrepareError => 4;
use constant TransactionError => 5;
push @{ $EXPORT_TAGS{all} }, 'NoError', 'Utf8Error', 'UrlError', 'ConnectionError', 'PrepareError', 'TransactionError';


$ffi->type(opaque => 'RustMysqlConn');
$ffi->type(opaque => 'RustMysqlStatement');


Rust::mysql::Error->init_record_layout($ffi);
$ffi->type("record(Rust::mysql::Error)" => 'Error');


$ffi->attach( rust_mysql_connect => ['string', 'string', 'string', 'Error*'] => 'RustMysqlConn' );
$ffi->attach( rust_mysql_disconnect => ['RustMysqlConn'] => 'void' );
$ffi->attach( rust_mysql_prepare => ['RustMysqlConn', 'string', 'Error*'] => 'RustMysqlStatement' );
$ffi->attach( rust_mysql_statement_destroy => ['RustMysqlStatement'] => 'void' );
$ffi->attach( rust_mysql_begin_work => ['RustMysqlConn', 'Error*'] => 'bool' );
$ffi->attach( rust_mysql_commit => ['RustMysqlConn', 'Error*'] => 'bool' );
$ffi->attach( rust_mysql_rollback => ['RustMysqlConn', 'Error*'] => 'bool' );



push @{ $EXPORT_TAGS{all} }, 'rust_mysql_connect', 'rust_mysql_disconnect', 'rust_mysql_prepare', 'rust_mysql_statement_destroy', 'rust_mysql_begin_work', 'rust_mysql_commit', 'rust_mysql_rollback';

1; 