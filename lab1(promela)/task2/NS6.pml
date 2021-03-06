mtype = {ok, err, msg1, msg2, msg3, keyA, keyB, agentA, agentB,
         nonceA, nonceB, agentI, keyI, nonceI };


typedef Crypt { mtype key, content1, content2 };

chan network = [0] of {mtype, /* msg# */
                       mtype, /* receiver */
                       Crypt
};

/* global variables for verification*/
mtype partnerA, partnerB;
mtype statusA = err;
mtype statusB = err; 

bool knows_nonceA = false, knows_nonceB = false;

//ltl always_end_ok { eventually (statusA == ok && statusB == ok) }
ltl PropAB { always ((statusA == ok && statusB == ok)  -> (partnerA == agentB && partnerB == agentA)) }
ltl PropA { always ((statusA == ok && partnerA == agentB ) -> (!knows_nonceA)) }
ltl PropB { always ((statusB == ok && partnerB == agentA ) -> (!knows_nonceB)) }
/* Agent (A)lice */
active proctype Alice() {
  /* local variables */
  
  mtype pkey;      /* the other agent's public key                 */
  mtype pnonce;    /* nonce that we receive from the other agent   */
  Crypt messageAB; /* our encrypted message to the other party     */
  Crypt data;      /* received encrypted message                   */


  /* Initialization  */
  if 
    :: partnerA = agentB; pkey = keyB;
    :: partnerA = agentI; pkey = keyI;
  fi

  /* Prepare the first message */
  
  messageAB.key = pkey;
  messageAB.content1 = agentA;
  messageAB.content2 = nonceA;  

  /* Send the first message to the other party */
  
  network ! msg1 (partnerA, messageAB);

  /* Wait for an answer. Observe the we are pattern-matching on the
     messages that start with msg2 and agentA, that is, we block until 
     we see a message with values msg2 and agentA as the first and second  
     components. The third component is copied to the variable data. */

  network ? (msg2, agentA, data);

  /* We proceed only if the key field of the data matches keyA and the
     received nonce is the one that we have sent earlier; block
     otherwise.  */

  (data.key == keyA) && (data.content1 == nonceA);

  /* Obtain Bob's nonce */
  
  pnonce = data.content2;

  /* Prepare the last message */  
  messageAB.key = pkey;
  messageAB.content1 = pnonce; 
  messageAB.content2 = 0;  /* content2 is not used in the last message,
                              just set it to 0 */

  
  /* Send the prepared messaage */
  network ! msg3 (partnerA, messageAB);

  
  /* and last - update the auxilary status variable */
  statusA = ok;

  printf("Done Alice\n")
}

active proctype Bob() {
   /* local variables */
  
  mtype pkey;      /* the other agent's public key                 */
  mtype pnonce;    /* nonce that we receive from the other agent   */
  Crypt messageBA; /* our encrypted message to the other party     */
  Crypt data;      /* received encrypted message                   */


  /* Initialization  */
  
  partnerB = agentA;
  pkey     = keyA; 

  // Step 1
  network ? (msg1, agentB, data);

  /* We proceed only if the key field of the data matches keyA and the
     received nonce is the one that we have sent earlier; block
     otherwise.  */

  (data.key == keyB) && (data.content1 == partnerB);
  pnonce = data.content2;
  
  // Step 2
  messageBA.key = pkey;
  messageBA.content1 = pnonce; 
  messageBA.content2 = nonceB;  
  
  /* Send the prepared messaage */
  network ! msg2 (partnerB, messageBA);

  // Step 3
  network ? (msg3, agentB, data)
  (data.key == keyB) && (data.content1 == nonceB);
  /* and last - update the auxilary status variable */
  statusB = ok;
  
  printf("Done Bob\n")
  
}

active proctype JockeP() {
  mtype msg, recpt, msg_type;
  Crypt data, intercepted;

  do
    :: network ? (msg_type, _, data) ->
       if /* perhaps store the message */
         :: (data.key == keyI) -> 
            intercepted.key = data.key;
            intercepted.content1 = data.content1;
            intercepted.content2 = data.content2;
            if
              :: msg_type == msg1 && intercepted.content1 == agentA -> knows_nonceA = true;
              :: msg_type == msg3 && intercepted.content1 == nonceB -> knows_nonceB = true;
              :: else -> skip;
            fi
         :: skip;
       fi ;

    :: /* Replay or send a message */
       if /* choose message type */
         :: msg = msg1;
         :: msg = msg2;
         :: msg = msg3;
       fi ;
       if /* choose a recepient */
         :: recpt = agentA;
         :: recpt = agentB;
       fi ;
       if /* replay intercepted message or assemble it */
         :: data.key    = intercepted.key;
            data.content1  = intercepted.content1;
            data.content2  = intercepted.content2;
         :: if
              :: msg == msg1 ->
                /* assemble  content1 */
                data.content1 = agentA;
                if /* assemble  content2 */
                  :: data.content2 = nonceI;
                  :: knows_nonceA -> data.content2 = nonceA;  //Added
                  :: knows_nonceB -> data.content2 = nonceB;  //Added
                fi;
              :: msg == msg2 -> 
                if /* assemble content1 */
                  :: data.content1 = nonceI;
                  :: knows_nonceA -> data.content1 = nonceA;  //Added
                  :: knows_nonceB -> data.content1 = nonceB;  //Added
                fi ;   
                if /* assemble  content2 */
                  :: data.content2 = nonceI;
                  :: knows_nonceA -> data.content2 = nonceA;  //Added
                  :: knows_nonceB -> data.content2 = nonceB;  //Added
                fi;
              :: msg == msg3 ->
                if /* assemble content1 */
                  :: data.content1 = nonceI;
                  :: knows_nonceA -> data.content1 = nonceA;  //Added
                  :: knows_nonceB -> data.content1 = nonceB;  //Added
                fi ;
                /* assemble  content2 */
                data.content2 = 0;
            fi
            if /* assemble key */
              :: data.key = keyA;
              :: data.key = keyB;
              :: data.key = keyI;
            fi ;
            
       fi ;
      network ! msg (recpt, data);
  od 
}
