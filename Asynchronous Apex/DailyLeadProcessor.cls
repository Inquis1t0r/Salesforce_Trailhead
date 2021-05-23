global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> currLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' OR LeadSource = null LIMIT 200];
        for (Lead lead : currLeads) {
            lead.LeadSource = 'Dreamforce';
        }

        if (currLeads.size() > 0) {
            update currLeads;
        }
    }
}
