xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare namespace amd = "java:amdocs.rpm.datatypes";

declare namespace ec. = "java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";

declare variable $RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::) external;
declare variable $BucketId  as xs:integer external;

declare function local:serviceInputToRechargeServiceRequest($RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::),$BucketId) as element() (:: schema-element(ns2:rechargeService) ::) {
    <ns2:rechargeService>
        <ns2:arg0>
            <location>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:location)}</location>
            <hub>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:hub)}</hub>
            <rateCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:rateCode)}</rateCode>
            <referenceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId)}</referenceId>
            <comments>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:comments)}</comments>
            <requestDateTime>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:requestDate)}</requestDateTime>
            <bulkTransaction>{2}</bulkTransaction>
            <l3TransactionID></l3TransactionID>
            <l3ValRcgAmtInd>{2}</l3ValRcgAmtInd>
            <pointOfSale>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:pointOfSale)}</pointOfSale>
            <distributor>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:distributor)}</distributor>
            <authorizationCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:authorizationCode)}</authorizationCode>
          
            <channelType>
            {
              if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'UD' )
              then 'RPL3USSDChannelInfo'
              else  
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'WB' )
                then 'RPL3WEBChannelInfo'
                else  
                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'MC' )
                  then 'RPL9MCSSChannelInfo'
                  else  
                    if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'RC' )
                    then 'RPL9RecargaContratoChannelInfo'
                    else  
                      if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'PM' )
                      then 'RPL9PMPChannelInfo'
                      else  
                          if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'RF' )
                          then 'RPL9RecargaFacturaChannelInfo'
                          else  
                              if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'IV' )
                              then 'IVRChannelInfo'
                              else  
                                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'PC' )
                                  then 'RPL9PortalCaptiveChannelInfo'
                                  else  
                                      if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'PS' )
                                      then 'RPL3POSChannelInfo'
                                      else  
                                          if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'CC' )
                                          then 'RPL9CallCenterChannelInfo'
                                          else  
                                              if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'PG' )
                                              then 'RPL9PortalManagerChannelInfo'
                                              else  
                                                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'SD' )
                                                  then 'RPL9SDPChannelInfo'
                                                  else  
                                                      if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId) ) = 'CR' )
                                                      then 'CRMChannelInfo'
                                                      else() 
            }
            </channelType>
        </ns2:arg0>
        <ns2:arg1>    
            <rechargeMethod>
            {

              if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'OTC' )
              then 'RPL3OTCRechargeMethodInfo'
              else  
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CC' )
                then 'CreditCardRechargeMethodInfo'
                else  
                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CA' )
                  then 'CashRechargeMethodInfo'
                  else  
                    if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CFQ' )
                    then 'RPL9ChargeForServicesMethodInfo'
                    else  
                      if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'LR' )
                      then 'RPL9LoyaltyPointsMethodInfo'
                      else  
                          if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'PR' )
                          then 'RPL9PostpaidControlledRechargeMethodInfo'
                          else  
                              if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'IN' )
                              then 'IncreaseRechargeMethodInfo'
                              else  
                                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'RD' )
                                  then 'ReduceRechargeMethodInfo'
                                  else() 
            }
            </rechargeMethod>
            {
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CA' ) then
                    <cashRechargeMethodInfo>
                        <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <coverDebitInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
                    </cashRechargeMethodInfo>
                else()
            }
            {
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'IN' ) then
                    <increaseRechargeMethodInfo>
                        <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <calcExpDateInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:calculateExpiryDate)}</calcExpDateInd>
                        <increaseType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:increaseType)}</increaseType>
                        <reasonCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
                    </increaseRechargeMethodInfo>
                else()
            }
            {
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'RD' ) then
                    <reduceRechargeMethodInfo>
                        <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <reduceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reduceType)}</reduceType>
                        <reasonCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
                    </reduceRechargeMethodInfo>
                else()
            }
            {
                    if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'OTC' ) then
                    <rPL3OTCRechargeMethodInfo>
                       <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <reduceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reduceType)}</reduceType>
                        <reasonCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
                        <l3ReasonDesc></l3ReasonDesc>
                        <l3OfferId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerId)}</l3OfferId>
                        <l3OfferInst>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerInstanceId)}</l3OfferInst>
                    </rPL3OTCRechargeMethodInfo>
                else()
            }
            {
                  if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CC' ) then
                    <creditCardRechargeMethodInfo>
                       <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <creditCardNumber>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:creditCardNumber)}</creditCardNumber>
                        <coverDebitInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
                        <creditCardType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:creditCardType)}</creditCardType>
                        <creditCardExpDate>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:expirationDate)}</creditCardExpDate>
                    </creditCardRechargeMethodInfo>
                else()
            }
            {
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'CFQ' ) then
                    <rPL9ChargeForServicesMethodInfo>
                        <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <reduceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reduceType)}</reduceType>
                        <reasonCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
                        <chargeCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:chargeCode)}</chargeCode>
                        <typeOfCharge>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:typeOfCharge)}</typeOfCharge>
                    </rPL9ChargeForServicesMethodInfo>
                else()
            }
            {
                if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'LR' ) then
                    <rPL9LoyaltyPointsMethodInfo>
                      <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <coverDebitInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
                    </rPL9LoyaltyPointsMethodInfo>
                else()
            }
            {
                 if(fn:upper-case(fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentMethod) ) = 'PR' ) then
                    <rPL9PostpaidControlledRechargeMethodInfo>
                       <paySourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceType)}</paySourceType>
                        <paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
                        <currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>
                        <amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
                        <coverDebitInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
                    </rPL9PostpaidControlledRechargeMethodInfo>
                else()
            }        
        </ns2:arg1>
        <ns2:arg2>
            <pcn>{fn:data($BucketId)}</pcn>
            <pcnPaymentCategory>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:prepaidBucket/ns1:paymentCategory)}</pcnPaymentCategory></ns2:arg2>
        <ns2:arg3>
            <primaryResourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceType)}</primaryResourceType>
            <primaryResourceValue>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</primaryResourceValue></ns2:arg3>
    </ns2:rechargeService>
};

local:serviceInputToRechargeServiceRequest($RechargeServiceRequest,$BucketId)