xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace v1="http://telefonica.cl/TefResponseHeader/V1";
declare namespace typ="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare namespace amd1 = "java:ec.com.kruger.ejb.rpl1rechargeservices.viewrecharges";

declare namespace amd = "java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";

declare variable $viewRechargesResponse as element() (:: schema-element(ns1:viewRechargesResponse) ::) external;

declare function local:func($viewRechargesResponse as element() (:: schema-element(ns1:viewRechargesResponse) ::) ) as element()  {
    <typ:ViewRechargesResponse>
         <typ:ViewRechargesResponseData>
		{
			if (exists($viewRechargesResponse/ns1:return/rechargeHeaderList))
			then
               for $rechargeItem in $viewRechargesResponse/ns1:return/rechargeHeaderList
               return
               <typ:viewRecharges>
               
               
                { 
                if($rechargeItem/rechargeIdentInfo) then (
               <typ:rechargeIdentificationInfo>
                   <typ:rechargeId>{fn:data($rechargeItem/rechargeIdentInfo/rcgId)}</typ:rechargeId>
                   <typ:periodKey>{fn:data($rechargeItem/rechargeIdentInfo/periodKey)}</typ:periodKey>
                   <typ:bucketKey>{fn:data($rechargeItem/rechargeIdentInfo/bucketKey)}</typ:bucketKey>
               </typ:rechargeIdentificationInfo>
               )else()}
               {if($rechargeItem/rechargeDatesInfo) then (
               <typ:rechargeDatesInfo>
{ if ($rechargeItem/rechargeDatesInfo/rcgRefDate/text() != "") then (
                   <typ:rechargeReferenceDate>{fn:data($rechargeItem/rechargeDatesInfo/rcgRefDate)}</typ:rechargeReferenceDate>) else ()}
{ if ($rechargeItem/rechargeDatesInfo/processDate/text() != "") then (
                   <typ:processDate>{fn:data($rechargeItem/rechargeDatesInfo/processDate)}</typ:processDate>) else ()}
{ if ($rechargeItem/rechargeDatesInfo/logicalDate/text() != "") then ( 
                   <typ:logicalDate>{fn:data($rechargeItem/rechargeDatesInfo/logicalDate)}</typ:logicalDate>) else ()}
{ if ($rechargeItem/rechargeDatesInfo/rcgReqDate/text() != "") then (
                   <typ:rechargeRequestDate>{fn:data($rechargeItem/rechargeDatesInfo/rcgReqDate)}</typ:rechargeRequestDate>) else ()} 
               </typ:rechargeDatesInfo>
               )else()}
               { if($rechargeItem/rechargeAmountsInfo) then (
               <typ:rechargeAmountsInfo>                  
                  <typ:inputAmount>
                      {
                       if(fn:contains($rechargeItem/rechargeAmountsInfo/inputAmt/text(), '.')) then 
                       <typ:amount>{concat(substring-before($rechargeItem/rechargeAmountsInfo/inputAmt/text(), '.'),'.', substring(substring-after($rechargeItem/rechargeAmountsInfo/inputAmt/text(), '.'),1,2))}</typ:amount> else
                       <typ:amount>{round-half-to-even(xs:decimal(xs:double(fn:data($rechargeItem/rechargeAmountsInfo/inputAmt))), 2)}</typ:amount>
                       }      
                      {if($rechargeItem/rechargeAmountsInfo/inputCurrency) then (
                      <typ:units>{fn:data($rechargeItem/rechargeAmountsInfo/inputCurrency)}</typ:units>
                      )else()}
                  </typ:inputAmount>
                      {if($rechargeItem/rechargeAmountsInfo/rcgChlAmt) then (                  
                   <typ:rechargeChannelAmount>{fn:data($rechargeItem/rechargeAmountsInfo/rcgChlAmt)}</typ:rechargeChannelAmount>
                      )else()}
                      {if($rechargeItem/rechargeAmountsInfo/ppsBalance) then (                      
                   <typ:ppsBalance>{fn:data($rechargeItem/rechargeAmountsInfo/ppsBalance)}</typ:ppsBalance>
                      )else()}    
                      {if($rechargeItem/rechargeAmountsInfo/ppsNewBalance) then (                      
                   <typ:ppsNewBalance>{fn:data($rechargeItem/rechargeAmountsInfo/ppsNewBalance)}</typ:ppsNewBalance>
                      )else()}    
                      {if($rechargeItem/rechargeAmountsInfo/ppsAmt) then (                      
                   <typ:ppsAmount>{fn:data($rechargeItem/rechargeAmountsInfo/ppsAmt)}</typ:ppsAmount>
                      )else()}                   
               </typ:rechargeAmountsInfo>
               )else()}
               { if($rechargeItem/rechargeBalanceExpirationInfo) then (
               <typ:rechargeBalanceExpirationInfo>
                    {if($rechargeItem/rechargeBalanceExpirationInfo/rcgNumOfDays/text() != "") then (               
                   <typ:rechargeNumberOfDays>{fn:data($rechargeItem/rechargeBalanceExpirationInfo/rcgNumOfDays)}</typ:rechargeNumberOfDays>
                    )else()}
                    {if($rechargeItem/rechargeBalanceExpirationInfo/balExpDateCalc/text() != "") then (                   
                   <typ:balanceExpirationDate>{fn-bea:date-from-dateTime($rechargeItem/rechargeBalanceExpirationInfo/balExpDateCalc)}</typ:balanceExpirationDate>
                   )else()}
               </typ:rechargeBalanceExpirationInfo>
               )else()}
               { if($rechargeItem/rechargeLogInfo) then ( 
               <typ:rechargeLogInfo>
                    {if($rechargeItem/rechargeLogInfo/rmdMainId) then (                   
                   <typ:rechargeMainId>{fn:data($rechargeItem/rechargeLogInfo/rmdMainId)}</typ:rechargeMainId>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/rmdVals) then (                                      
                   <typ:rechargeValue>{fn:data($rechargeItem/rechargeLogInfo/rmdVals)}</typ:rechargeValue>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/cdMainId) then (                                      
                   <typ:channelDetailMainId>{fn:data($rechargeItem/rechargeLogInfo/cdMainId)}</typ:channelDetailMainId>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/cdVals) then (                                      
                   <typ:channelDetailValue>{fn:data($rechargeItem/rechargeLogInfo/cdVals)}</typ:channelDetailValue>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/cdUniqueId) then (                                      
                   <typ:channelDetailUniqueId>{fn:data($rechargeItem/rechargeLogInfo/cdUniqueId)}</typ:channelDetailUniqueId>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/clientTimeStamp) then (                                      
                   <typ:clientTimeStamp>{fn:data($rechargeItem/rechargeLogInfo/clientTimeStamp)}</typ:clientTimeStamp>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/radTimeStamp) then (                                      
                   <typ:radTimeStamp>{fn:data($rechargeItem/rechargeLogInfo/radTimeStamp)}</typ:radTimeStamp>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/rplTimeStamp) then (                                      
                   <typ:rplTimeStamp>{fn:data($rechargeItem/rechargeLogInfo/rplTimeStamp)}</typ:rplTimeStamp>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/subIdVals) then (                                      
                   <typ:subscriberIdValue>{fn:data($rechargeItem/rechargeLogInfo/subIdVals)}</typ:subscriberIdValue>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/typeOfCharge) then (                                      
                   <typ:typeOfCharge>{fn:data($rechargeItem/rechargeLogInfo/typeOfCharge)}</typ:typeOfCharge>
                    )else()}                                       
               </typ:rechargeLogInfo>
               )else()}
               { if($rechargeItem/rechargeLogInfo) then (
                <typ:paymentChannel>
                    {if($rechargeItem/rechargeLogInfo/pointOfSale) then (                     
                    <typ:pointOfSale>{fn:data($rechargeItem/rechargeLogInfo/pointOfSale)}</typ:pointOfSale>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/hub) then ( 
                    <typ:hub>{fn:data($rechargeItem/rechargeLogInfo/hub)}</typ:hub>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/distributor) then (                     
                    <typ:distributor>{fn:data($rechargeItem/rechargeLogInfo/distributor)}</typ:distributor>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/location) then (                     
                    <typ:location>{fn:data($rechargeItem/rechargeLogInfo/location)}</typ:location>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/authorizationCode) then (                     
                    <typ:authorizationCode>{fn:data($rechargeItem/rechargeLogInfo/authorizationCode)}</typ:authorizationCode>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/rateCode) then (                     
                    <typ:rateCode>{fn:data($rechargeItem/rechargeLogInfo/rateCode)}</typ:rateCode>
                    )else()}
                    {if($rechargeItem/rechargeLogInfo/comments) then (                     
                    <typ:comments>{fn:data($rechargeItem/rechargeLogInfo/comments)}</typ:comments>
                    )else()}
               
               </typ:paymentChannel>   
               )else()}
               { if($rechargeItem/rechargeStatusInfo) then (     
               <typ:rechargeStatusInfo>
                   <typ:rechargeStatus>{fn:data($rechargeItem/rechargeStatusInfo/rcgStatus)}</typ:rechargeStatus>
                    {if($rechargeItem/rechargeStatusInfo/lastStsUpdate/text() != "") then (                                      
                   <typ:lastStatusUpdateDate>{fn:data($rechargeItem/rechargeStatusInfo/lastStsUpdate)}</typ:lastStatusUpdateDate>
                    )else()}
                    {if($rechargeItem/rechargeStatusInfo/relRcgType) then (                   
                   <typ:releaseRechargeType>{fn:data($rechargeItem/rechargeStatusInfo/relRcgType)}</typ:releaseRechargeType>
                    )else()}
                    {if($rechargeItem/rechargeStatusInfo/cdCancelRefId) then (                                      
                   <typ:cdCancelReferenceId>{fn:data($rechargeItem/rechargeStatusInfo/cdCancelRefId)}</typ:cdCancelReferenceId>
                    )else()}
                    {if($rechargeItem/rechargeStatusInfo/cancelRcgType) then (                                      
                   <typ:cancelRechargeType>{fn:data($rechargeItem/rechargeStatusInfo/cancelRcgType)}</typ:cancelRechargeType>
                    )else()}
                    {if($rechargeItem/rechargeStatusInfo/relRcgId) then (                                      
                   <typ:releaseRechargeId>{fn:data($rechargeItem/rechargeStatusInfo/relRcgId)}</typ:releaseRechargeId>
                    )else()}
                                       
               </typ:rechargeStatusInfo>
               )else()}
               { if($rechargeItem/rechargeTypeInfo) then (
               <typ:rechargeTypeInfo>
                   <typ:rechargeMethodCode>{fn:data($rechargeItem/rechargeTypeInfo/methodCode)}</typ:rechargeMethodCode>
                   <typ:rechargeMethodGroup>{fn:data($rechargeItem/rechargeTypeInfo/methodGroup)}</typ:rechargeMethodGroup>
                   <typ:rechargeMethodType>{fn:data($rechargeItem/rechargeTypeInfo/methodType)}</typ:rechargeMethodType>
                   <typ:rechargeChannelCode>{fn:data($rechargeItem/rechargeTypeInfo/channelCode)}</typ:rechargeChannelCode>
                   <typ:rechargeType>{fn:data($rechargeItem/rechargeTypeInfo/rcgType)}</typ:rechargeType>
                    {if($rechargeItem/rechargeTypeInfo/splitRcgSeq) then (                      
                   <typ:splitRechargeSequence>{fn:data($rechargeItem/rechargeTypeInfo/splitRcgSeq)}</typ:splitRechargeSequence>
                   )else()}
               </typ:rechargeTypeInfo>
               )else()}
               { if($rechargeItem/rechargeBucketInfo) then (
               <typ:rechargeBucketInfo>
                   <typ:bucketId>{fn:data($rechargeItem/rechargeBucketInfo/bucketId)}</typ:bucketId>
                   <typ:billingAccountNumber>{fn:data($rechargeItem/rechargeBucketInfo/ban)}</typ:billingAccountNumber>
                   <typ:billingArrangementId>{fn:data($rechargeItem/rechargeBucketInfo/ben)}</typ:billingArrangementId>
                   <typ:prepaidBucketId>{fn:data($rechargeItem/rechargeBucketInfo/pcn)}</typ:prepaidBucketId>
                   <typ:paymentChannelName>{fn:data($rechargeItem/rechargeBucketInfo/pcnName)}</typ:paymentChannelName>
                   <typ:customerId>{fn:data($rechargeItem/rechargeBucketInfo/customerId)}</typ:customerId>
                    {if($rechargeItem/rechargeBucketInfo/crmExternalId) then (  
                   <typ:crmExternalId>{fn:data($rechargeItem/rechargeBucketInfo/crmExternalId)}</typ:crmExternalId>
                   )else()}
                   <typ:currency>{fn:data($rechargeItem/rechargeBucketInfo/currency)}</typ:currency>
{ if ( $rechargeItem/rechargeBucketInfo/balExpDate/text() != "" ) then (
                   <typ:balanceExpirationDate>{fn-bea:date-from-dateTime($rechargeItem/rechargeBucketInfo/balExpDate)}</typ:balanceExpirationDate>) else ()}
               </typ:rechargeBucketInfo>
               )else()}
               { if($rechargeItem/rechargeSubscriberInfo) then (
               <typ:subscriber>
                   <typ:subscriberId>{fn:data($rechargeItem/rechargeSubscriberInfo/subscriberNo)}</typ:subscriberId>
                   <typ:primaryResourceType>{fn:data($rechargeItem/rechargeSubscriberInfo/primaryResourceType)}</typ:primaryResourceType>
                   <typ:primaryResourceValue>{fn:data($rechargeItem/rechargeSubscriberInfo/primaryResourceValue)}</typ:primaryResourceValue>
               </typ:subscriber>
               )else()}
               { if($rechargeItem/accumulationsAmounts) then (
               <typ:accumulationsAmountsInfo>
                    {if($rechargeItem/accumulationsAmounts/instlAmt) then ( 
                   <typ:installmentAmount>{fn:data($rechargeItem/accumulationsAmounts/instlAmt)}</typ:installmentAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/regBonusAmt) then (                    
                   <typ:regularBonusAmount>{fn:data($rechargeItem/accumulationsAmounts/regBonusAmt)}</typ:regularBonusAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/addBonusAmt) then (                    
                   <typ:additionalBonusAmount>{fn:data($rechargeItem/accumulationsAmounts/addBonusAmt)}</typ:additionalBonusAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/reduceAmt) then (                    
                   <typ:reduceByAmount>{fn:data($rechargeItem/accumulationsAmounts/reduceAmt)}</typ:reduceByAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/debtAmt) then (                    
                   <typ:debitAmount>{fn:data($rechargeItem/accumulationsAmounts/debtAmt)}</typ:debitAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/createChargeAmt) then (                    
                   <typ:createChargeAmount>{fn:data($rechargeItem/accumulationsAmounts/createChargeAmt)}</typ:createChargeAmount>
                    )else()}
                    {if($rechargeItem/accumulationsAmounts/loanAmt) then (                    
                   <typ:loanAmount>{fn:data($rechargeItem/accumulationsAmounts/loanAmt)}</typ:loanAmount>
                    )else()}                                       
               </typ:accumulationsAmountsInfo>
                )else()}
               </typ:viewRecharges>  
			else(<typ:viewRecharges/>)
        }
         </typ:ViewRechargesResponseData>
      </typ:ViewRechargesResponse>

};

local:func($viewRechargesResponse)