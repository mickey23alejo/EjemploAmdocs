xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";


declare namespace ns2 = "http://telefonica.cl/TefResponseHeader/V1";

declare variable $res as element() external;
declare variable $idMessage as xs:string external;
declare variable $serviceName as xs:string external;
declare variable $transactionID as xs:string external;

declare function local:func($idMessage,$serviceName,$transactionID,$res as element() 
) as element()  {
    <ns1:ValidateAddressResponse>            
          <ns2:TefHeaderRes>
            <ns2:idMessage>{fn:data($idMessage)}</ns2:idMessage>
            <ns2:serviceName>{fn:data($serviceName)}</ns2:serviceName>
            <ns2:responseDateTime>{fn:current-dateTime()}</ns2:responseDateTime>            
            <ns2:transactionID>{fn:data($transactionID)}</ns2:transactionID>
        </ns2:TefHeaderRes>
        <ns1:ValidateAddressResponse_data>
            <ns1:generalStatus>
                <ns1:code>{fn:data($res/ns1:RetrieveAddressInformationResponse_data/ns1:generalStatus/ns1:code)}</ns1:code>
                {
                    if ($res/ns1:RetrieveAddressInformationResponse_data/ns1:generalStatus/ns1:description)
                    then <ns1:description>{fn:data($res/ns1:RetrieveAddressInformationResponse_data/ns1:generalStatus/ns1:description)}</ns1:description>
                    else ()
                }
            </ns1:generalStatus>            
            {
                if ($res/ns1:RetrieveAddressInformationResponse_data/ns1:addressCode)
                then <ns1:normalizationCode>{fn:data($res/ns1:RetrieveAddressInformationResponse_data/ns1:addressCode)}</ns1:normalizationCode>
                else ()
            }
            
             {
              if(
              fn:exists($res/ns1:RetrieveAddressInformationResponse_data/ns1:infoDetails/ns1:addressInfo
                [dvmtr:lookup('Address/DVM/dvm_Address_DatosTematicos','CodigoTematico',ns1:code,'IsRedZone','N') = 'Y'])
              and   
              fn:exists($res/ns1:RetrieveAddressInformationResponse_data/ns1:infoDetails/ns1:addressInfo/ns1:characteristicValue
                [dvmtr:lookup('Address/DVM/dvm_Address_DatosTematicos','ValorTematico',ns1:value,'IsRedZone','N') = 'Y'])
                ) 
              then <ns1:isRedZone>Y</ns1:isRedZone>
              else <ns1:isRedZone>N</ns1:isRedZone>
            }
            
            {
              if(
              fn:exists($res/ns1:RetrieveAddressInformationResponse_data/ns1:infoDetails/ns1:addressInfo
                [dvmtr:lookup('Address/DVM/dvm_Address_DatosTematicos','CodigoTematico',ns1:code,'IsBlacklisted','N') = 'Y'])
              and   
              fn:exists($res/ns1:RetrieveAddressInformationResponse_data/ns1:infoDetails/ns1:addressInfo/ns1:characteristicValue
                [dvmtr:lookup('Address/DVM/dvm_Address_DatosTematicos','ValorTematico',ns1:value,'IsBlacklisted','N') = 'Y'])
                ) 
              then <ns1:isBlacklisted>Y</ns1:isBlacklisted>
              else <ns1:isBlacklisted>N</ns1:isBlacklisted>
            }
    
        </ns1:ValidateAddressResponse_data>
    </ns1:ValidateAddressResponse>
};

local:func($idMessage,$serviceName,$transactionID,$res)