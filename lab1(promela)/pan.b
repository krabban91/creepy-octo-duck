	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 11
		;
		((P2 *)this)->i = trpt->bup.ovals[1];
	/* 0 */	((P2 *)this)->i = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 4: // STATE 4
		;
		now.forklocations[ Index(((P2 *)this)->i, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 5
		;
		_m = unsend(now.forks[ Index(((P2 *)this)->i, 4) ]);
		;
		goto R999;

	case 6: // STATE 6
		;
		now.hasEaten[ Index(((P2 *)this)->i, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 7
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 11
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 12
		;
	/* 0 */	((P2 *)this)->i = trpt->bup.oval;
		;
		;
		goto R999;

	case 10: // STATE 15
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 16
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC checker */
;
		;
		;
		;
		;
		;
		
	case 16: // STATE 6
		;
		((P1 *)this)->p = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 19
		;
		((P1 *)this)->i = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->p = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 19: // STATE 11
		;
		((P1 *)this)->p = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 19
		;
		((P1 *)this)->i = trpt->bup.ovals[1];
		((P1 *)this)->i = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 21: // STATE 19
		;
		((P1 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 26
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC phil */

	case 23: // STATE 2
		;
		((P0 *)this)->disposable = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 25: // STATE 5
		;
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = trpt->bup.ovals[2];
	/* 0 */	((P0 *)this)->disposable = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.forks[ Index(((P0 *)this)->i, 4) ], XX-1, 0, ((int)((P0 *)this)->disposable), 1);
		((P0 *)this)->disposable = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 26: // STATE 8
		;
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ], XX-1, 0, ((int)((P0 *)this)->disposable), 1);
		((P0 *)this)->disposable = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 27: // STATE 12
		;
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = trpt->bup.ovals[2];
	/* 0 */	((P0 *)this)->disposable = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ], XX-1, 0, ((int)((P0 *)this)->disposable), 1);
		((P0 *)this)->disposable = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 28: // STATE 15
		;
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.forks[ Index(((P0 *)this)->i, 4) ], XX-1, 0, ((int)((P0 *)this)->disposable), 1);
		((P0 *)this)->disposable = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 29: // STATE 19
		goto R999;

	case 30: // STATE 20
		;
		now.hasEaten[ Index(((P0 *)this)->i, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 22
		;
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = trpt->bup.oval;
		_m = unsend(now.forks[ Index(((P0 *)this)->i, 4) ]);
		;
		goto R999;

	case 32: // STATE 25
		;
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = trpt->bup.oval;
		_m = unsend(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]);
		;
		goto R999;

	case 33: // STATE 30
		;
		p_restor(II);
		;
		;
		goto R999;
	}

