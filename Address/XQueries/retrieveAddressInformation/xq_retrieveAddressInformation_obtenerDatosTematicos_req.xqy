xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.latam.cl/ServiceOrderManagement/ServiceAvailability/ServiceAddressValidation/ObtenerDatosTematicos/types";

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";


declare variable $req as element() external;

declare function local:func($req as element() ) as element()  {
   <ns2:ObtenerDatosTematicosRequest>
       <ns2:CodigoNormalizacion>{fn:data($req/ns1:RetrieveAddressInformationRequest_data/ns1:addressCode)}</ns2:CodigoNormalizacion>
  </ns2:ObtenerDatosTematicosRequest>
}; 
 
local:func($req)