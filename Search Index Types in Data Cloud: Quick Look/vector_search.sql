select c.Chunk_c, v.score_c from vector_search(table(WikiArticle_c_vector_search_2_index__dlm),
 'how does Google Chrome internet browser work', '', 100) as v join WikiArticle_c_vector_search_2_
chunk_dlm as c on v.SourceRecordId_c=c.RecordId_c ORDER by v.score_c desc limit 3;
