xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns3="http://www.kruger.com.ec/";
(:: import schema at "../../../AmdocsCkABP/WSDL/RPL/RPL1SubscriberServicesBS.wsdl" ::)

declare namespace amd1 = "java:amdocs.rpm.datatypes";

declare namespace amd = "java:amdocs.galaxy.RPL1SubscriberServices";
declare namespace ns1 = "java:ec.com.kruger.ejb.rpl1subscriberservices.subscriberservices";

declare variable $viewAllSubscriberBalanceDetailsResponse as element() (:: schema-element(ns3:viewAllSubscriberBalanceDetailsResponse) ::) external;

declare function local:func($viewAllSubscriberBalanceDetailsResponse as element() (:: schema-element(ns3:viewAllSubscriberBalanceDetailsResponse) ::)) as element()  {
    <ns2:RetrieveSubscriptionBalanceResponse>
        <ns2:RetrieveSubscriptionBalanceResponseData>
            <ns2:subscriptionBalanceResponse>
                <ns2:BucketBalanceInfo>
                {if($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/pcn) then
                    <ns2:paymentChannelNumber>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/pcn)}</ns2:paymentChannelNumber>
                else()}
                {if($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/status) then
                    <ns2:status>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/status)}</ns2:status>
                else()}
                {if($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/statusDate) then
                    <ns2:statusChangeDate>{fn-bea:date-from-dateTime($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/statusDate)}</ns2:statusChangeDate>
                else()}
               {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/balanceAmount) then (   
                    <ns2:balanceAmount>
                      {
                       if(fn:contains($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/balanceAmount/text(), '.')) then 
                       <ns2:amount>{concat(substring-before($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/balanceAmount/text(), '.'),'.', substring(substring-after($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/balanceAmount/text(), '.'),1,2))}</ns2:amount> else
                       <ns2:amount>{round-half-to-even(xs:decimal(xs:double(fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/balanceAmount))), 2)}</ns2:amount>
                       }
                        {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/currencyCode) then (
                        <ns2:units>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/currencyCode)}</ns2:units>)
                        else()}                        
                    </ns2:balanceAmount>)
                else()}    
                {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/amountPrecision) then (
                    <ns2:amountPrecision>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/amountPrecision)}</ns2:amountPrecision>
                )else()}
                {if($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/totalResAmount) then (
                    <ns2:totalReservedAmount>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/totalResAmount)}</ns2:totalReservedAmount>
                )else()}
                {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/businessEntity) then (
                    <ns2:businessEntity>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/businessEntity)}</ns2:businessEntity>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastTrxId) then (
                    <ns2:lastTransactionId>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastTrxId)}</ns2:lastTransactionId>
                 )else()}                    
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityCode) then (   
                    <ns2:lastActivityCode>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityCode)}</ns2:lastActivityCode>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityAmount) then (                 
                    <ns2:lastActivityAmount>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityAmount)}</ns2:lastActivityAmount>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityResAmount) then (                 
                    <ns2:lastActivityReservedAmount>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastActivityResAmount)}</ns2:lastActivityReservedAmount>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/barringCode) then (                 
                    <ns2:barringCode>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/barringCode)}</ns2:barringCode>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/creationDate) then (                 
                    <ns2:recordCreationDate>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/creationDate)}</ns2:recordCreationDate>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastUpdateDate) then (                 
                    <ns2:record>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/lastUpdateDate)}</ns2:record>
                 )else()}
                 {if ($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/returnCode) then (                 
                    <ns2:returnCode>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/olcQueryBalanceInfo/returnCode)}</ns2:returnCode>
                  )else()}                         
                </ns2:BucketBalanceInfo>
                {
                if(fn:empty($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/bucketHeader/bucketRcgDateInfo/balExpDate/text())) then
                ()
                else
                <ns2:BucketRechargeDate>
                    <ns2:balanceExpirationDate>{fn-bea:date-from-dateTime(fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/bucketHeader/bucketRcgDateInfo/balExpDate))}</ns2:balanceExpirationDate>
                    <ns2:lastRechargeExpirationId>{fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/bucketHeader/bucketRcgDateInfo/lastRcgExpId)}</ns2:lastRechargeExpirationId>
                    {
                    if(fn:empty($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/bucketHeader/bucketRcgDateInfo/lastRcgDate/text())) then
                    ()
                    else
                    <ns2:lastRechargeDate>{fn-bea:date-from-dateTime(fn:data($viewAllSubscriberBalanceDetailsResponse/ns3:return/bucketBalanceInfo[1]/bucketHeader/bucketRcgDateInfo/lastRcgDate))}</ns2:lastRechargeDate>
                    }
                </ns2:BucketRechargeDate>
                }
           </ns2:subscriptionBalanceResponse>
        </ns2:RetrieveSubscriptionBalanceResponseData>                                
    </ns2:RetrieveSubscriptionBalanceResponse>
};

local:func($viewAllSubscriberBalanceDetailsResponse)