xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.latam.cl/ServiceOrderManagement/ServiceAvailability/ServiceAddressValidation/ValidarDireccionNormalizada/types";

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";


declare variable $req as element() external;

declare function local:func($req as element() ) as element()  {
    <ns2:ValidarDireccionNormalizadaRequest>      
        <ns2:address>
            <ns2:AddressType>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressType)}</ns2:AddressType>
            {
                if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:additionalComments)
                then <ns2:Comments>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:additionalComments)}</ns2:Comments>
                else ()
            }           
            <ns2:poBox>
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:poBox/ns1:boxNr)
                    then <ns2:POBoxNumber>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:poBox/ns1:boxNr)}</ns2:POBoxNumber>
                    else ()
                }
            </ns2:poBox>
            <ns2:regionalDivisions>
                <ns2:Country>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:regionalDivisions/ns1:country)}</ns2:Country>
                <ns2:ProvinceRegion>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:regionalDivisions/ns1:stateOrProvince)}</ns2:ProvinceRegion>
                <ns2:BarrioComuna>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:regionalDivisions/ns1:commune)}</ns2:BarrioComuna>
            </ns2:regionalDivisions>
            <ns2:addressDetails>
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:locality)
                    then <ns2:City>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:locality)}</ns2:City>
                    else ()
                }
                <ns2:Street>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:streetName)}</ns2:Street>
                <ns2:StreetNumber>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:streetNrFirst)}</ns2:StreetNumber>
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:block)
                    then <ns2:Block>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:block)}</ns2:Block>
                    else ()
                }
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:postcode)
                    then <ns2:CP>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:addressDetails/ns1:postcode)}</ns2:CP>
                    else ()
                }              
            </ns2:addressDetails>
            <ns2:housingComplex>
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:levelNr)
                    then <ns2:Floor>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:levelNr)}</ns2:Floor>
                    else ()
                }
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:subUnitNr)
                    then <ns2:Apartment>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:subUnitNr)}</ns2:Apartment>
                    else ()
                }
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:housingComplexType)
                    then <ns2:HousingComplexType>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:housingComplexType)}</ns2:HousingComplexType>
                    else ()
                }
                {
                    if ($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:housingComplexName)
                    then <ns2:HousingComplex>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:address/ns1:housingComplex/ns1:housingComplexName)}</ns2:HousingComplex>
                    else ()
                }
            </ns2:housingComplex>         
        </ns2:address>
    </ns2:ValidarDireccionNormalizadaRequest>
};

local:func($req)