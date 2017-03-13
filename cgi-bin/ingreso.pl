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
print $q->start_html('Inscripción de nombre de dominio - NIC Chile');
print "<img src='../cc51t/logo-eslogan-R.png' alt='logo NIC' title='NIC' />";
print "<br /><br />";
&conectarBD;
&ingresarDominio;
$idDominio = &obtenerID;
# ingresar los datos del titular
&ingresarContacto("'".$q->param('rutTitular')."'",
                  $q->param('nombreTitular'),
                  $q->param('emailTitular'),
                  $q->param('calleTitular'),
                  $q->param('numTitular'),
                  $q->param('regionTitular'),
                  $q->param('comunaTitular'),
                  $q->param('fonoTitular'),
                  "''"); # para el titular no se pide giro
$idContactoTitular = &obtenerID;
&ingresarDominioContacto($idDominio,$idContactoTitular,"'o'");
# ingresar los datos de facturacion
&ingresarContacto("'".$q->param('rutFactura')."'",
                  $q->param('razonFactura'),
                  $q->param('emailFactura'),
                  $q->param('calleFactura'),
                  $q->param('numFactura'),
                  $q->param('regionFactura'),
                  $q->param('comunaFactura'),
                  $q->param('fonoFactura'),
                  "'".$q->param('giroFactura')."'");
$idContactoFactura = &obtenerID;
&ingresarDominioContacto($idDominio,$idContactoFactura,"'b'");
# se ingresan los datos del contacto tecnico
&ingresarContacto("''",
                  $q->param('nombreTecnico'),
                  $q->param('emailTecnico'),
                  $q->param('calleTecnico'),
                  $q->param('numTecnico'),
                  $q->param('regionTecnico'),
                  $q->param('comunaTecnico'),
                  $q->param('fonoTecnico'),
                  "''");
$idContactoTecnico = &obtenerID;
&ingresarDominioContacto($idDominio,$idContactoTecnico,"'t'");
# ahora se ingresan los hosts
&ingresarHost($q->param('servidorPrimario'));
$idServidorPrimario = &obtenerID;
&ingresarDominioHost($idDominio,$idServidorPrimario);
# los servidores secundarios pueden ser vacios
if($q->param('servidorSecundario1') ne '') {
  &ingresarHost($q->param('servidorSecundario1'));
  $idServidorSecundario1 = &obtenerID;
  &ingresarDominioHost($idDominio,$idServidorSecundario1);
}
if($q->param('servidorSecundario2') ne '') {
  &ingresarHost($q->param('servidorSecundario2'));
  $idServidorSecundario2 = &obtenerID;
  &ingresarDominioHost($idDominio,$idServidorSecundario2);
}

print "<h3>Sus datos han sido ingresados a la base de datos</h3><br />";
print "<a href='../cc51t/index.html'>Volver al menú principal</a>";

print $q->end_html;

# funciones
sub conectarBD {
  $dsn = "dbi:mysql:$database:localhost:3306";
  $dbh = DBI->connect($dsn, $user, $password) or die "Unable to connect: $DBI::errstr\n";
}

# subrutina que ingresa el nombre del dominio a la base de datos
sub ingresarDominio {
  my $query = "INSERT INTO `dominio` (`nombre`) VALUES ('".$q->param('nombreDominio')."')";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr();
}

sub ingresarContacto {
  my $query = "INSERT INTO `contacto` (`rut`, `nombre`, `email`, `direccion_calle`, `direccion_numero`, `region`, `comuna`, `telefono`, `giro`) VALUES (".$_[0].",'".$_[1]."','".$_[2]."','".$_[3]."','".$_[4]."','".$_[5]."','".$_[6]."','".$_[7]."',".$_[8].")";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr();
}

sub obtenerID {
  my $query = "SELECT LAST_INSERT_ID()";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr();
  my $id;
  while ( ($col) = $sth->fetchrow_array() ) 
  {
    $id = $col;
  }
  return $id;
}

sub ingresarDominioContacto {
  my $query = "INSERT INTO `dominio_contacto` (`dominio`, `contacto`, `rol`) VALUES (".$_[0].",".$_[1].",".$_[2].")";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr(); 
}

sub ingresarHost {
  my $query = "INSERT INTO `host` (`nombre_host`) VALUES ('".$_[0]."')";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr();
}

sub ingresarDominioHost {
  my $query = "INSERT INTO `dominio_host` (`dominio`, `host`) VALUES (".$_[0].",".$_[1].")";
  my $sth   = $dbh->prepare($query);
  $sth->execute() or die "Cannot execute: " . $sth->errstr(); 
}