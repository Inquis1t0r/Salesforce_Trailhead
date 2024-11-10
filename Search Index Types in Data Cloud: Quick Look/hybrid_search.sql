select c.Chunk__c, h.hybrid_score__c, h.keyword_score__c, h.vector_score__c from
hybrid_search(table(WikiArticle_c_hybrid_search_2_index__dlm), 'how does Google Chrome
internet browser work ?', '', 100) as h join WikiArticle_c_hybrid_search_2_chunk__dlm
as c on h.SourceRecordId__c=c.RecordId__c ORDER by h.hybrid_score__c desc limit 2;
