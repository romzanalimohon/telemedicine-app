import 'package:flutter/material.dart';

class RefundPolicy extends StatelessWidget {
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text('Refund Policy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text('''Payments for the services offered by ticonsultancy.co.uk shall be on a 100% advance basis. (Unless an exception made under a special offer) The payment for service once subscribed to by the subscriber is not refundable and any amount paid shall stand appropriated. Refund if any will be at the sole discretion of Trust Immigration Consultant and it offers no guarantees whatsoever for the accuracy or timeliness of the refunds reaching the Customers card/bank accounts. All the payments made towards participating in any events are 100% non-refundable if refund is request is received within 90 days of the event date. 50% of total participation fee is refundable if refund request is received at least 91 days before the event date. Please note participation fee does not include cost towards accommodation during the event.

 

Also, under the laws applicable in your jurisdiction, subscribers may qualify for a refund if requested during a short period of time after the beginning of the subscription. For example, citizens of the European Union are entitled to a full refund during the 14 days after the subscription begins however if any newsletter is already delivered to promote the subscriber than a fixed fee of 2500 USD will be deducted. Please note that this 14-day period commences from the date of payment. No refunds are applicable on AGENT CRM account so user must only upgrade if satisfied with the FREE trial and the Demo

 

Trust Immigration Consultant gives no guarantees. All is on a best effort basis and liability is limited to refund of amount only. Trust Immigration Consultant undertakes no liability for free services and trial accounts. Trust Immigration Consultant reserves its right to amend/alter or change all or any disclaimers or terms of agreements at any time without any prior notice. All terms/disclaimers whether specifically mentioned or not shall be deemed to be included if any reference is made to them.

 

In case of force majeure Trust Immigration Consultant or ticonsultancy.co.uk will be excused from performance under any of their Agreement/Event and shall not be liable for any refund or credit note to be given to affected clients also cannot be held responsible for any delay in performance or non-performance, in whole or in part, caused by the occurrence of any event or contingency beyond the control of Trust Immigration Consultant or ticonsultancy.co.uk including, but not limited to, work stoppages, fires, civil disobedience, riots, rebellions, natural disasters, acts of God, acts of war or terrorism, actions or decrees of governmental bodies, spread of any epidemic or virus and similar occurrences.

 

Trust Immigration Consultant or ticonsultancy.co.uk will be responsible to inform its client who have been so affected by giving a written notice and shall use its best efforts to resume performance, however no assurances to be assumed. Upon receipt of such notice, all obligations under any particular Agreement shall be immediately suspended for the duration of such Force Majeure Event.

 

Subscriber must read all the documents related to the service carefully as we do not guarantee any results by use of the portal as fully subscribed member.''', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
