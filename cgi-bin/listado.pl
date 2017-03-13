#!/usr/bin/perl -w

use CGI;
use DBI;
use DBD::mysql;
use utf8;

# datos de la BD
$database = "cc51t_db_14";
# $host     = "localhost";
# $port     = "3306";
$user     = "cc51t_u_14";
$password = "nbuodl3C";

my $q = new CGI; 
print $q->header;
print $q->start_html({-style=>'../cc51t/css/form.css'},'Listado de dominios inscritos - NIC Chile');
print "<img src='../cc51t/logo-eslogan-R.png' alt='logo NIC' title='NIC' />";
print "<br /><br />";
print "<table border='1' cellspacing='0' cellpadding='10'>";
print "<tr><th>Dominio</th><th>Fecha de creación</th><th>Contacto titular</th><th>Email del titular</th></tr>";
&conectarBD;

my $query = "SELECT DO.id, DO.nombre, DO.fecha_creacion, CO.nombre, CO.email FROM dominio DO, contacto CO, dominio_contacto DC WHERE DO.id=DC.dominio AND CO.id=DC.contacto AND DC.rol='o' ORDER BY DO.fecha_creacion DESC; ";
my $sth   = $dbh->prepare($query);
$sth->execute() or die "Cannot execute: " . $sth->errstr();
while ( ($id, $dominio,$fecha,$titular,$email) = $sth->fetchrow_array() ) 
{
  print "<tr><td><a href='detalles.pl?id=".$id."'>".$dominio."</a></td><td>".$fecha."</td><td>".$titular."</td><td>".$email."</td></tr>";
}
print "</table><br />";
print "<a href='../cc51t/index.html'>Volver al menú principal</a>";
print $q->end_html;

sub conectarBD {
  $dsn = "dbi:mysql:$database:localhost:3306";
  $dbh = DBI->connect($dsn, $user, $password) or die "Unable to connect: $DBI::errstr\n";
}