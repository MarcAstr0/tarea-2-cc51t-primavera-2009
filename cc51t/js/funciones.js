 var comunas = ['ARICA', 'ALGARROBO', 'ALHUE', 'ALTO BIOBIO', 'ALTODELCARMEN', 'ALTOHOSPICIO', 'ANCUD', 'ANDACOLLO', 'ANGOL', 'ANTOFAGASTA', 'ANTUCO', 'ARAUCO', 'AYSEN', 'BUIN', 'BULNES', 'CABILDO', 'CABO DE HORNOS', 'CABRERO', 'CALAMA', 'CALBUCO', 'CALDERA', 'CALERA DE TANGO', 'CALLELARGA', 'CAMARONES', 'CAMINA', 'CANELA', 'CANETE', 'CARAHUE', 'CARTAGENA', 'CASABLANCA', 'CASTRO', 'CATEMU', 'CAUQUENES', 'CERRILLOS', 'CERRO NAVIA', 'CHAITEN', 'CHANARAL', 'CHANCO', 'CHEPICA', 'CHIGUAYANTE', 'CHILE CHICO', 'CHILLAN', 'CHILLANVIEJO', 'CHIMBARONGO', 'CHOLCHOL', 'CHONCHI', 'CISNES', 'COBQUECURA', 'COCHAMO', 'COCHRANE', 'CODEGUA', 'COELEMU', 'COIHUECO', 'COINCO', 'COLBUN', 'COLCHANE', 'COLINA', 'COLLIPULLI', 'COLTAUCO', 'COMBARBALA', 'CONCEPCION', 'CONCHALI', 'CONCON', 'CONSTITUCION', 'CONTULMO', 'COPIAPO', 'COQUIMBO', 'CORONEL', 'CORRAL', 'COYHAIQUE', 'CUNCO', 'CURACAUTIN', 'CURACAVI', 'CURACO DE VELEZ', 'CURANILAHUE', 'CURARREHUE', 'CUREPTO', 'CURICO', 'DALCAHUE', 'DIEGODEALMAGRO', 'DONIHUE', 'EL BOSQUE', 'EL MONTE', 'ELCARMEN', 'ELQUISCO', 'ELTABO', 'EMPEDRADO', 'ERCILLA', 'ESTACION CENTRAL', 'FLORIDA', 'FREIRE', 'FREIRINA', 'FRESIA', 'FRUTILLAR', 'FUTALEUFU', 'FUTRONO', 'GALVARINO', 'GENERALLAGOS', 'GORBEA', 'GRANEROS', 'GUAITECAS', 'HIJUELAS', 'HUALAIHUE', 'HUALANE', 'HUALPEN', 'HUALQUI', 'HUARA', 'HUASCO', 'HUECHURABA', 'ILLAPEL', 'INDEPENDENCIA', 'IQUIQUE', 'ISLA DE MAIPO', 'ISLADEPASCUA', 'JUANFERNANDEZ', 'LA CISTERNA', 'LA FLORIDA', 'LA GRANJA', 'LA PINTANA', 'LA REINA', 'LA UNION', 'LACALERA', 'LACRUZ', 'LAESTRELLA', 'LAGO RANCO', 'LAGO VERDE', 'LAGUNA BLANCA', 'LAHIGUERA', 'LAJA', 'LALIGUA', 'LAMPA', 'LANCO', 'LAS CONDES', 'LASCABRAS', 'LASERENA', 'LAUTARO', 'LEBU', 'LICANTEN', 'LIMACHE', 'LINARES', 'LITUECHE', 'LLANQUIHUE', 'LLAY-LLAY', 'LO BARNECHEA', 'LO ESPEJO', 'LO PRADO', 'LOLOL', 'LONCOCHE', 'LONGAVI', 'LONQUIMAY', 'LOS ALAMOS', 'LOS ANGELES', 'LOS LAGOS', 'LOS MUERMOS', 'LOS SAUCES', 'LOSANDES', 'LOSVILOS', 'LOTA', 'LUMACO', 'MACHALI', 'MACUL', 'MAFIL', 'MAIPU', 'MALLOA', 'MARCHIGUE', 'MARIA PINTO', 'MARIAELENA', 'MARIQUINA', 'MAULE', 'MAULLIN', 'MEJILLONES', 'MELIPEUCO', 'MELIPILLA', 'MOLINA', 'MONTEPATRIA', 'MULCHEN', 'NACIMIENTO', 'NANCAGUA', 'NATALES', 'NAVIDAD', 'NEGRETE', 'NINHUE', 'NIQUEN', 'NOGALES', 'NUEVA IMPERIAL', 'NUNOA', 'OHIGGINS', 'OLIVAR', 'OLLAGUE', 'OLMUE', 'OSORNO', 'OVALLE', 'PADRE HURTADO', 'PADRE LAS CASAS', 'PAIHUANO', 'PAILLACO', 'PAINE', 'PALENA', 'PALMILLA', 'PANGUIPULLI', 'PANQUEHUE', 'PAPUDO', 'PAREDONES', 'PARRAL', 'PEDRO AGUIRRE CERDA', 'PELARCO', 'PELLUHUE', 'PEMUCO', 'PENAFLOR', 'PENALOLEN', 'PENCAHUE', 'PENCO', 'PERALILLO', 'PERQUENCO', 'PETORCA', 'PEUMO', 'PICA', 'PICHIDEGUA', 'PICHILEMU', 'PINTO', 'PIRQUE', 'PITRUFQUEN', 'PLACILLA', 'PORTEZUELO', 'PORVENIR', 'POZOALMONTE', 'PRIMAVERA', 'PROVIDENCIA', 'PUCHUNCAVI', 'PUCON', 'PUDAHUEL', 'PUENTE ALTO', 'PUERTO MONTT', 'PUERTO OCTAY', 'PUERTO VARAS', 'PUMANQUE', 'PUNITAQUI', 'PUNTA ARENAS', 'PUQUELDON', 'PUREN', 'PURRANQUE', 'PUTAENDO', 'PUTRE', 'PUYEHUE', 'QUEILEN', 'QUELLON', 'QUEMCHI', 'QUILACO', 'QUILICURA', 'QUILLECO', 'QUILLON', 'QUILLOTA', 'QUILPUE', 'QUINCHAO', 'QUINTA NORMAL', 'QUINTADETILCOCO', 'QUINTERO', 'QUIRIHUE', 'RANCAGUA', 'RANQUIL', 'RAUCO', 'RECOLETA', 'RENAICO', 'RENCA', 'RENGO', 'REQUINOA', 'RETIRO', 'RINCONADA', 'RIO BUENO', 'RIO IBANEZ', 'RIO NEGRO', 'RIO VERDE', 'RIOCLARO', 'RIOHURTADO', 'ROMERAL', 'SAAVEDRA', 'SAGRADAFAMILIA', 'SALAMANCA', 'SAN BERNARDO', 'SAN GREGORIO', 'SAN JOAQUIN', 'SAN JOSE DE MAIPO', 'SAN JUAN DE LA COSTA', 'SAN MIGUEL', 'SAN PABLO', 'SAN PEDRO', 'SAN PEDRO DE LA PAZ', 'SAN RAMON', 'SAN ROSENDO', 'SANANTONIO', 'SANCARLOS', 'SANCLEMENTE', 'SANESTEBAN', 'SANFABIAN', 'SANFELIPE', 'SANFERNANDO', 'SANFRANCISCODEMOSTAZAL', 'SANIGNACIO', 'SANJAVIER', 'SANNICOLAS', 'SANPEDRODEATACAMA', 'SANRAFAEL', 'SANTA BARBARA', 'SANTA JUANA ', 'SANTACRUZ', 'SANTAMARIA', 'SANTIAGO', 'SANTIAGO OESTE', 'SANTIAGO SUR', 'SANTODOMINGO', 'SANVICENTE', 'SIERRAGORDA', 'TALAGANTE', 'TALCA', 'TALCAHUANO', 'TALTAL', 'TEMUCO', 'TENO', 'TEODORO SCHMIDT', 'TIERRAAMARILLA', 'TIL-TIL', 'TIMAUKEL', 'TIRUA', 'TOCOPILLA', 'TOLTEN', 'TOME', 'TORRES DEL PAINE', 'TORTEL', 'TRAIGUEN', 'TREHUACO', 'TUCAPEL', 'VALDIVIA', 'VALLENAR', 'VALPARAISO', 'VICHUQUEN', 'VICTORIA', 'VICUNA', 'VILCUN', 'VILLAALEGRE', 'VILLAALEMANA', 'VILLARRICA', 'VINADELMAR', 'VITACURA', 'YERBASBUENAS', 'YUMBEL', 'YUNGAY', 'ZAPALLAR'];

var regiones = ["REGION DE ARICA Y PARINACOTA", "REGION DE TARAPACA", "REGION DE ANTOFAGASTA", "REGION DE ATACAMA", "REGION DE COQUIMBO", "REGION DE VALPARAISO", "REGION METROPOLITANA DE SANTIAGO", "REGION DEL LIBERTADOR BERNARDO O'HIGGINS", "REGION DEL MAULE", "REGION DEL BIO BIO", "REGION DE LA ARAUCANIA", "REGION DE LOS RIOS", "REGION DE LOS LAGOS", "REGION DE AYSEN DEL GENERAL CARLOS IBAÑEZ DEL CAMPO", "REGION DE MAGALLANES Y LA ANTARTICA CHILENA"];

function poblarComunas(id) {
    for (var i=0; i<comunas.length; i++) {
        var tmp = new Option(comunas[i], comunas[i]);
        document.getElementById(id).options.add(tmp);
    }
}

function poblarRegiones(id) {
    for (var i=0; i<regiones.length; i++) {
        var tmp = new Option(regiones[i], regiones[i]);
        document.getElementById(id).options.add(tmp);
    }
}
