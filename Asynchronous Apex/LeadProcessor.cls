global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    global Integer RECORDS_PROC = 0;

    global Database.QueryLocator start(Database.BatchableContext batchableContext) {
        String sQuery = 'SELECT Id, Name, Status, LeadSource FROM Lead  LIMIT 100000';
        return Database.getQueryLocator(sQuery);
    }

    global void execute(Database.BatchableContext batchableContext, List<Lead> scope) {
        for (Lead l : scope) {
            l.LeadSource = 'Dreamforce';
            RECORDS_PROC += 1;
        }
        update scope;
    }

    global void finish(Database.BatchableContext batchableContext) {
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, TotalJobItems, JobItemsProcessed, CreatedBy.Email FROM AsyncApexJob WHERE Id = :batchableContext.getJobId()];
        String s = '';
        s += job.JobItemsProcessed + ' job items processed ';
        s += 'out of ' + job.TotalJobItems + ' total job items.  ';
        s += job.NumberOfErrors + ' error(s) encountered. ';
        System.debug(s);
        s = RECORDS_PROC + ' record(s) processed.';
        System.debug(s);
    }
}
