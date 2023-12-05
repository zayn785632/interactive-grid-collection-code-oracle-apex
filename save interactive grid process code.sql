BEGIN
if not apex_collection.collection_exists('PO') then 

apex_collection.CREATE_COLLECTION ('PO');
 end if;

     case :APEX$ROW_STATUS
    when 'C' then
        :SEQ_ID := APEX_COLLECTION.ADD_MEMBER(
        p_collection_name => 'PO',
        p_C001            => :ITEM_NAME,
        p_C002            => :UOM,
        p_C003            => :RATE,
	p_C004            => :QTY
);

    when 'U' then
        APEX_COLLECTION.UPDATE_MEMBER(
        p_collection_name => 'PO',
        P_SEQ             =>  :SEQ_ID,
       	p_C001            => :ITEM_NAME,
        p_C002            => :UOM,
        p_C003            => :RATE,
	p_C004            => :QTY);
        
    when 'D' then
        APEX_COLLECTION.DELETE_MEMBER(
            p_collection_name => 'PO',
            P_SEQ             => :SEQ_ID
        );

     end case;
      END ; 
