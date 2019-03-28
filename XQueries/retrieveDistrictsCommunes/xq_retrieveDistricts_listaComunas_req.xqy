xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://comuna.webservices.col.direccionNormalizada.telefonica.cl/";

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";


declare variable $req as element() external;

declare function local:func($req as element() ) as element(){
    <ns2:listarComunas>        
        <listComunasService>
            <idRegion>{
            fn:data($req/ns1:RetrieveDistrictsRequest_data/ns1:departmentRegion/ns1:code)}</idRegion>
        </listComunasService>
    </ns2:listarComunas>
};

local:func($req)