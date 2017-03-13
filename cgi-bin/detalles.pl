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
print $q->start_html({-style=>'../cc51t/css/form.css'},'Detalles de dominio - NIC Chile');
my $idDominio = $q->param('id');
&conectarBD;
print "<img src='../cc51t/logo-eslogan-R.png' alt='logo NIC' title='NIC' />";
print "<br /><br />";

my $query = "SELECT DO.nombre FROM dominio DO WHERE DO.id=".$idDominio;
my $sth   = $dbh->prepare($query);
$sth->execute() or die "Cannot execute: " . $sth->errstr();
my $nombre;
while ( ($nombredominio) = $sth->fetchrow_array() ) 
{
  $nombre = $nombredominio;
}
print "<h1>Detalles del dominio ".$nombre."<h1>";
print "<h3>Hosts</h3>";
print "<ul>";
my $query = "SELECT DISTINCT HO.nombre_host FROM host HO, dominio DO, dominio_host DH WHERE DH.dominio=".$idDominio." AND DH.host=HO.id;";
my $sth   = $dbh->prepare($query);
$sth->execute() or die "Cannot execute: " . $sth->errstr();
while ( ($hostname) = $sth->fetchrow_array() ) 
{
  print "<li>".$hostname."</li>";
}
print "</ul>";

print "<h3>Contactos</h3>";
print "<table border='1' cellspacing='0' cellpadding='10'>";
print "<tr><th>RUT</th><th>Nombre</th><th>email</th><th>Calle</th><th>Número</th><th>Región</th><th>Comuna</th><th>Teléfono</th><th>Giro</th><th>Rol</th></tr>";
my $query = "SELECT CO.rut, CO.nombre, CO.email, CO.direccion_calle, CO.direccion_numero, CO.region, CO.comuna, CO.telefono, CO.giro, DC.rol FROM contacto CO, dominio DO, dominio_contacto DC WHERE DC.dominio=DO.id AND DC.contacto=CO.id AND DO.id=".$idDominio;
my $sth   = $dbh->prepare($query);
$sth->execute() or die "Cannot execute: " . $sth->errstr();
while ( ($rut,$nombre,$email,$calle,$numero,$region,$comuna,$telefono,$giro,$rol) = $sth->fetchrow_array() ) 
{
  print "<tr><td>".$rut."</td><td>".$nombre."</td><td>".$email."</td><td>".$calle."</td><td>".$numero."</td><td>".$region."</td><td>".$comuna."</td><td>".$telefono."</td><td>".$giro."</td>";
  if($rol eq 'o') { print "<td>Titular</td></tr>"; }
  if($rol eq 'b') { print "<td>Facturación</td></tr>"; }
  if($rol eq 't') { print "<td>Técnico</td></tr>"; }
}
print "</table>";

print "<br /><a href='../cc51t/index.html'>Volver al menú principal</a>";
print $q->end_html;

sub conectarBD {
  $dsn = "dbi:mysql:$database:localhost:3306";
  $dbh = DBI->connect($dsn, $user, $password) or die "Unable to connect: $DBI::errstr\n";
}