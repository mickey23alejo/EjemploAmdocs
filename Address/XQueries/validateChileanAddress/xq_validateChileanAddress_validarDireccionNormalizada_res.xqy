xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.latam.cl/ServiceOrderManagement/ServiceAvailability/ServiceAddressValidation/ValidarDireccionNormalizada/types";

declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";


declare namespace ns3 = "http://telefonica.cl/TefResponseHeader/V1";

declare variable $res as element()  external;
declare variable $idMessage as xs:string external;
declare variable $serviceName as xs:string external;
declare variable $transactionID as xs:string external;

declare function local:func($idMessage,$serviceName,$transactionID,$res as element() ) as element()  {
    <ns2:ValidateAddressResponse>          
         <ns3:TefHeaderRes>
            <ns3:idMessage>{fn:data($idMessage)}</ns3:idMessage>
            <ns3:serviceName>{fn:data($serviceName)}</ns3:serviceName>
            <ns3:responseDateTime>{fn:current-dateTime()}</ns3:responseDateTime>            
            <ns3:transactionID>{fn:data($transactionID)}</ns3:transactionID>
        </ns3:TefHeaderRes>
        <ns2:ValidateAddressResponse_data>
            <ns2:generalStatus>
                <ns2:code>{fn:data($res/ns1:generalStatus/ns1:CodigoRetorno)}</ns2:code>
                {
                    if ($res/ns1:generalStatus/ns1:DescripcionCodigoRetorno)
                    then <ns2:description>{fn:data($res/ns1:generalStatus/ns1:DescripcionCodigoRetorno)}</ns2:description>
                    else ()
                }
            </ns2:generalStatus>
            <ns2:validatedAddresses>
                {
                    for $DireccionesNormalizadas in $res/ns1:DireccionesNormalizadas
                    return 
                    <ns2:Address>
                        {
                            if ($DireccionesNormalizadas/ns1:CodigoNormalizacion)
                            then <ns2:normalizationCode>{fn:data($DireccionesNormalizadas/ns1:CodigoNormalizacion)}</ns2:normalizationCode>
                            else ()
                        }
                        <ns2:regionalDivisions>
                            <ns2:country>{fn:data($DireccionesNormalizadas/ns1:regionalDivisions/ns1:Country)}</ns2:country>
                            <ns2:stateOrProvince>{fn:data($DireccionesNormalizadas/ns1:regionalDivisions/ns1:ProvinceRegion)}</ns2:stateOrProvince>
                            <ns2:commune>{fn:data($DireccionesNormalizadas/ns1:regionalDivisions/ns1:BarrioComuna)}</ns2:commune>
                        </ns2:regionalDivisions>
                        <ns2:addressDetails>
                            {
                                if ($DireccionesNormalizadas/ns1:addressDetails/ns1:City)
                                then <ns2:locality>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:City)}</ns2:locality>
                                else ()
                            }
                            <ns2:streetName>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:Street)}</ns2:streetName>
                            <ns2:streetNrFirst>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:StreetNumber)}</ns2:streetNrFirst>
                            {
                                if ($DireccionesNormalizadas/ns1:addressDetails/ns1:Block)
                                then <ns2:block>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:Block)}</ns2:block>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:addressDetails/ns1:CP)
                                then <ns2:postcode>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:CP)}</ns2:postcode>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:addressDetails/ns1:EntreCalle1)
                                then <ns2:betweenStreet1>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:EntreCalle1)}</ns2:betweenStreet1>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:addressDetails/ns1:EntreCalle2)
                                then <ns2:betweenStreet2>{fn:data($DireccionesNormalizadas/ns1:addressDetails/ns1:EntreCalle2)}</ns2:betweenStreet2>
                                else ()
                            }
                        </ns2:addressDetails>
                        <ns2:housingComplex>
                            {
                                if ($DireccionesNormalizadas/ns1:housingComplex/ns1:Floor)
                                then <ns2:levelNr>{fn:data($DireccionesNormalizadas/ns1:housingComplex/ns1:Floor)}</ns2:levelNr>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:housingComplex/ns1:Apartment)
                                then <ns2:subUnitNr>{fn:data($DireccionesNormalizadas/ns1:housingComplex/ns1:Apartment)}</ns2:subUnitNr>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:housingComplex/ns1:HousingComplexType)
                                then <ns2:housingComplexType>{fn:data($DireccionesNormalizadas/ns1:housingComplex/ns1:HousingComplexType)}</ns2:housingComplexType>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:housingComplex/ns1:HousingComplex)
                                then <ns2:housingComplexName>{fn:data($DireccionesNormalizadas/ns1:housingComplex/ns1:HousingComplex)}</ns2:housingComplexName>
                                else ()
                            }
                        </ns2:housingComplex>
                        <ns2:poBox>
                            {
                                if ($DireccionesNormalizadas/ns1:poBox/ns1:POBoxNumber)
                                then <ns2:boxNr>{fn:data($DireccionesNormalizadas/ns1:poBox/ns1:POBoxNumber)}</ns2:boxNr>
                                else ()
                            }
                        </ns2:poBox>
                        <ns2:coordinates>
                            {
                                if ($DireccionesNormalizadas/ns1:coordinates/ns1:CoordenadaX)
                                then <ns2:x>{fn:data($DireccionesNormalizadas/ns1:coordinates/ns1:CoordenadaX)}</ns2:x>
                                else ()
                            }
                            {
                                if ($DireccionesNormalizadas/ns1:coordinates/ns1:CoordenadaY)
                                then <ns2:y>{fn:data($DireccionesNormalizadas/ns1:coordinates/ns1:CoordenadaY)}</ns2:y>
                                else ()
                            }
                        </ns2:coordinates>
                        {
                            if ($DireccionesNormalizadas/ns1:Comments)
                            then <ns2:additionalComments>{fn:data($DireccionesNormalizadas/ns1:Comments)}</ns2:additionalComments>
                            else ()
                        }
                        <ns2:addressType>{fn:data($DireccionesNormalizadas/ns1:AddressType)}</ns2:addressType>
                      </ns2:Address>
                }
            </ns2:validatedAddresses>          
            {
               if ($res/ns1:generalStatus/ns1:CodigoRetorno = "0" and fn:count($res/ns1:DireccionesNormalizadas)>0)
              then <ns2:isValid>Y</ns2:isValid>
              else <ns2:isValid>N</ns2:isValid>
            }         
        </ns2:ValidateAddressResponse_data>
    </ns2:ValidateAddressResponse>
};

local:func($idMessage,$serviceName,$transactionID,$res)