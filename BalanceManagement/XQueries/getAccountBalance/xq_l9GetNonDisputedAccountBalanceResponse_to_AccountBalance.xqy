xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns1="http://www.kruger.com.ec/";

declare namespace ns3 = "http://telefonica.cl/TefResponseHeader/V1";

declare namespace amd = "java:amdocs.ar.datalayer.datatypes";

declare namespace functx = "http://www.functx.com";

declare variable $l9GetNonDisputedAccountBalanceResponse as element() external;

declare function local:pow($x as xs:integer , $n as xs:integer ) as xs:integer
{
  if($n eq 0)
   then 1
   else
    (let $h := $n idiv 2,
         $halfResult := local:pow($x, $h)
      return
            if($n mod 2 eq 0)
              then $halfResult * $halfResult
              else $x * $halfResult * $halfResult
        )

};

declare function local:func($l9GetNonDisputedAccountBalanceResponse as element() ) as element()  {
    
        <ns2:accountBalance>
            <ns2:customerNames>
                <ns2:givenNames>{fn:data($l9GetNonDisputedAccountBalanceResponse//nameLine1)}</ns2:givenNames>
                <ns2:familiyNames>{fn:data($l9GetNonDisputedAccountBalanceResponse//nameLine2)}</ns2:familiyNames></ns2:customerNames>
            <ns2:customerAccountInfo>
                <ns2:ID>{fn:data($l9GetNonDisputedAccountBalanceResponse//accountId)}</ns2:ID>
                <ns2:cmAccountId>{fn:data($l9GetNonDisputedAccountBalanceResponse//cmAccountNumber)}</ns2:cmAccountId>
                <ns2:lockInfo>{fn:data($l9GetNonDisputedAccountBalanceResponse//lockInfo/accountTimestamp)}</ns2:lockInfo>
                <ns2:accountStatus>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//writeOffStatus))}</ns2:accountStatus>
                <ns2:collectionIndicator>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//collectionIndicator))}</ns2:collectionIndicator>
                {
                if ( $l9GetNonDisputedAccountBalanceResponse//collectionIndUpdateDate != "") then
                <ns2:collectionIndUpdateDate>{fn-bea:date-from-dateTime($l9GetNonDisputedAccountBalanceResponse//collectionIndUpdateDate)}</ns2:collectionIndUpdateDate>
                else ()
                }
                
                <ns2:_customerPayment>
                    <ns2:_paymentMethod>
                        <ns2:paymentMethodType>{fn:data($l9GetNonDisputedAccountBalanceResponse//l9PaymentMethod)}</ns2:paymentMethodType></ns2:_paymentMethod></ns2:_customerPayment>
                { if ( $l9GetNonDisputedAccountBalanceResponse//l9AccountType != "" ) then
                <ns2:accountType>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9AccountType)) } </ns2:accountType>
                else()
                }
                
                { if ($l9GetNonDisputedAccountBalanceResponse//l9CompanyCode != "") then
                <ns2:companyCode>{xs:string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9CompanyCode)) }</ns2:companyCode>
                else ()
                }
            </ns2:customerAccountInfo>
            <ns2:customer>
                <ns2:customerID>{fn:data($l9GetNonDisputedAccountBalanceResponse//l9CustomerNumber)}</ns2:customerID>
                <ns2:customerTypeCode>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9CustomerType)) }</ns2:customerTypeCode>
                <ns2:customerSubTypeCode>{xs:string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9CustomerSubType)) }</ns2:customerSubTypeCode>
                <ns2:documentType>{fn:data($l9GetNonDisputedAccountBalanceResponse//documentType)}</ns2:documentType>
            </ns2:customer>
            <ns2:customerAccountBalance>
                <ns2:balance>
                     {
                          if(fn:contains($l9GetNonDisputedAccountBalanceResponse//arBalance/text(),'E')) then (
                              <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//arBalance/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//arBalance/text(),'E')))))}</ns2:amount>
                          )
                          else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//arBalance))}</ns2:amount>)
                      }
                      {
                          if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                              <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                          )else()
                      }
                  </ns2:balance>
                <ns2:accountBalancePolicy>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//acctBalPolicy))}</ns2:accountBalancePolicy>
                    {
                        if ( $l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance != "") then
                        <ns2:disputeBalance>
                            {
                              if($l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance) then (
                                  if(fn:contains($l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance/text(),'E')) then (
                                    <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance/text(),'E')))))}</ns2:amount>
                                    )
                                    else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//l9DisputeBalance))}</ns2:amount>)
                                )else()
                            }
                            {
                              if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                              <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                              )else()
                            }
                        </ns2:disputeBalance>
                    else ()
                    }
                <ns2:netARBalance>
                    {
                        if(fn:contains($l9GetNonDisputedAccountBalanceResponse//l9NetArBalance/text(),'E')) then (
                           <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//l9NetArBalance/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//l9NetArBalance/text(),'E')))))}</ns2:amount>
                        )
                        else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//l9NetArBalance))}</ns2:amount>)
                    }
                    {
                        if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                           <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                        )else()
                    }
                </ns2:netARBalance>
                    { if ($l9GetNonDisputedAccountBalanceResponse//balanceUpdateDate != "") then (
                    <ns2:balanceUpdateDate>{fn-bea:date-from-dateTime($l9GetNonDisputedAccountBalanceResponse//balanceUpdateDate)}</ns2:balanceUpdateDate>) else ()}
                <ns2:unappliedAmount>
                    {
                        if(fn:contains($l9GetNonDisputedAccountBalanceResponse//l9UnappliedAmount/text(),'E')) then (
                           <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//l9UnappliedAmount/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//l9UnappliedAmount/text(),'E')))))}</ns2:amount>
                        )
                        else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//l9UnappliedAmount))}</ns2:amount>)
                    }
                    {
                        if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                           <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                        )else()
                    }
                    </ns2:unappliedAmount>
               </ns2:customerAccountBalance>
            <ns2:allowedPayServiceInd>{fn:codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9AllowedPayServiceInd))}</ns2:allowedPayServiceInd>
            <ns2:customerDisputedAmount>
                <ns2:nonDisputedPastDue>
                    {
                        if(fn:contains($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedPastDue/text(),'E')) then (
                           <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedPastDue/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedPastDue/text(),'E')))))}</ns2:amount>
                        )
                        else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedPastDue))}</ns2:amount>)
                    }
                    {
                        if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                           <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                        )else()
                    }
                </ns2:nonDisputedPastDue>
                <ns2:nonDisputedAmountDue>
                    {
                        if(fn:contains($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedAmountDue/text(),'E')) then (
                           <ns2:amount>{xs:integer(xs:double(fn:number(fn:substring-before($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedAmountDue/text(),'E'))) * local:pow(10,xs:integer(fn:number(fn:substring-after($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedAmountDue/text(),'E')))))}</ns2:amount>
                        )
                        else (<ns2:amount>{xs:decimal(fn:data($l9GetNonDisputedAccountBalanceResponse//l9NonDisputedAmountDue))}</ns2:amount>)
                    }
                    {
                        if($l9GetNonDisputedAccountBalanceResponse//currency)then(
                           <ns2:units>{fn:data($l9GetNonDisputedAccountBalanceResponse//currency)}</ns2:units>
                        )else()
                    }                    
                </ns2:nonDisputedAmountDue>
            </ns2:customerDisputedAmount>
            <ns2:businessEntityID>{fn:data($l9GetNonDisputedAccountBalanceResponse//be)}</ns2:businessEntityID>
            <ns2:paymentArrangementInd>{codepoints-to-string(fn:data($l9GetNonDisputedAccountBalanceResponse//l9PAIndicator))}</ns2:paymentArrangementInd>
            
      </ns2:accountBalance>
};

declare function functx:substring-before-last
  ( $arg as xs:string? ,
    $delim as xs:string )  as xs:string {

   if (matches($arg, functx:escape-for-regex($delim)))
   then replace($arg,
            concat('^(.*)', functx:escape-for-regex($delim),'.*'),
            '$1')
   else ''
 } ;

declare function functx:escape-for-regex
  ( $arg as xs:string? )  as xs:string {

   replace($arg,
           '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')
 } ;

local:func($l9GetNonDisputedAccountBalanceResponse)