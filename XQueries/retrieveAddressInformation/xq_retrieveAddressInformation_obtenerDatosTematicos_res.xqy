xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.latam.cl/ServiceOrderManagement/ServiceAvailability/ServiceAddressValidation/ObtenerDatosTematicos/types";

declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";


declare namespace tef = "http://telefonica.cl/TefResponseHeader";

declare variable $res as element()  external;

declare function local:func($res as element() ) as element() {
    <ns2:RetrieveAddressInformationResponse>
        <ns2:RetrieveAddressInformationResponse_data>
            {
                if ($res/ns1:CodigoNormalizacion)
                then <ns2:addressCode>{fn:data($res/ns1:CodigoNormalizacion)}</ns2:addressCode>
                else ()
            }
            <ns2:infoDetails>
                {
                    for $DatosTematicos in $res/ns1:DatosTematicos
                    return 
                    <ns2:addressInfo>
                        <ns2:code>{fn:data($DatosTematicos/ns1:CodigoTematico)}</ns2:code>
                        <ns2:description>{fn:data($DatosTematicos/ns1:DescripcionTematico)}</ns2:description>
                        <ns2:name>{fn:data($DatosTematicos/ns1:ValorTematico)}</ns2:name>
                        <ns2:characteristicValue>
                            <ns2:value>{fn:data($DatosTematicos/ns1:CharacteristicValue/ns1:CodigoValor)}</ns2:value>
                        </ns2:characteristicValue>
                          { 
                            if ($DatosTematicos/ns1:Restrictivo = "SI")
                              then <ns2:isRestrictive>true</ns2:isRestrictive>
                              else <ns2:isRestrictive>false</ns2:isRestrictive>
                           }
                     </ns2:addressInfo>
                }
                </ns2:infoDetails>
            <ns2:generalStatus>
                <ns2:code>{fn:data($res/ns1:generalStatus/ns1:CodigoRetorno)}</ns2:code>
                {
                    if ($res/ns1:generalStatus/ns1:DescripcionCodigoRetorno)
                    then <ns2:description>{fn:data($res/ns1:generalStatus/ns1:DescripcionCodigoRetorno)}</ns2:description>
                    else ()
                }
            </ns2:generalStatus>
        </ns2:RetrieveAddressInformationResponse_data>
    </ns2:RetrieveAddressInformationResponse>
};

local:func($res)