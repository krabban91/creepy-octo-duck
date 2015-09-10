#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - Philosophers.pml:77 - [((i>=4))] (17:0:2 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((((P2 *)this)->i>=4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->i = 0;
		/* merge: goto :b4(17, 2, 17) */
		reached[2][2] = 1;
		;
		/* merge: i = 0(17, 11, 17) */
		reached[2][11] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 4: // STATE 4 - Philosophers.pml:78 - [forklocations[i] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = now.forklocations[ Index(((P2 *)this)->i, 4) ];
		now.forklocations[ Index(((P2 *)this)->i, 4) ] = 1;
#ifdef VAR_RANGES
		logval("forklocations[:init::i]", now.forklocations[ Index(((P2 *)this)->i, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 5 - Philosophers.pml:78 - [forks[i]!i] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_full(now.forks[ Index(((P2 *)this)->i, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((P2 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", ((P2 *)this)->i); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((P2 *)this)->i, 4) ], 0, ((P2 *)this)->i, 1);
		_m = 2; goto P999; /* 0 */
	case 6: // STATE 6 - Philosophers.pml:78 - [hasEaten[i] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		(trpt+1)->bup.oval = now.hasEaten[ Index(((P2 *)this)->i, 4) ];
		now.hasEaten[ Index(((P2 *)this)->i, 4) ] = 0;
#ifdef VAR_RANGES
		logval("hasEaten[:init::i]", now.hasEaten[ Index(((P2 *)this)->i, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 7 - Philosophers.pml:78 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 11 - Philosophers.pml:81 - [i = 0] (0:17:1 - 3)
		IfNotBlocked
		reached[2][11] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 12 - Philosophers.pml:83 - [((i>=4))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		if (!((((P2 *)this)->i>=4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.oval = ((P2 *)this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->i = 0;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 15 - Philosophers.pml:84 - [(run phil(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][15] = 1;
		if (!(addproc(II, 1, 0, ((P2 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 16 - Philosophers.pml:84 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 20 - Philosophers.pml:86 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[2][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC checker */
	case 13: // STATE 1 - Philosophers.pml:57 - [((i>=4))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)this)->i>=4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - Philosophers.pml:58 - [assert(((forklocations[i]<=1)&&(forklocations[i]>=0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		spin_assert(((now.forklocations[ Index(((P1 *)this)->i, 4) ]<=1)&&(now.forklocations[ Index(((P1 *)this)->i, 4) ]>=0)), "((forklocations[i]<=1)&&(forklocations[i]>=0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - Philosophers.pml:60 - [((hasEaten[i]>100))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((now.hasEaten[ Index(((P1 *)this)->i, 4) ]>100)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - Philosophers.pml:61 - [p = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->p;
		((P1 *)this)->p = 0;
#ifdef VAR_RANGES
		logval("checker:p", ((P1 *)this)->p);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - Philosophers.pml:62 - [((p>=4))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!((((P1 *)this)->p>=4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: p */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->p;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->p = 0;
		/* merge: goto :b3(20, 8, 20) */
		reached[1][8] = 1;
		;
		/* merge: i = (i+1)(20, 19, 20) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->i;
		((P1 *)this)->i = (((P1 *)this)->i+1);
#ifdef VAR_RANGES
		logval("checker:i", ((P1 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 18: // STATE 10 - Philosophers.pml:63 - [assert((hasEaten[p]>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		spin_assert((now.hasEaten[ Index(((P1 *)this)->p, 4) ]>0), "(hasEaten[p]>0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 11 - Philosophers.pml:63 - [p = (p+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->p;
		((P1 *)this)->p = (((P1 *)this)->p+1);
#ifdef VAR_RANGES
		logval("checker:p", ((P1 *)this)->p);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 16 - Philosophers.pml:65 - [i = i] (0:20:2 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->i;
		((P1 *)this)->i = ((P1 *)this)->i;
#ifdef VAR_RANGES
		logval("checker:i", ((P1 *)this)->i);
#endif
		;
		/* merge: .(goto)(20, 18, 20) */
		reached[1][18] = 1;
		;
		/* merge: i = (i+1)(20, 19, 20) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->i;
		((P1 *)this)->i = (((P1 *)this)->i+1);
#ifdef VAR_RANGES
		logval("checker:i", ((P1 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: // STATE 19 - Philosophers.pml:67 - [i = (i+1)] (0:20:1 - 5)
		IfNotBlocked
		reached[1][19] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->i;
		((P1 *)this)->i = (((P1 *)this)->i+1);
#ifdef VAR_RANGES
		logval("checker:i", ((P1 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 22: // STATE 26 - Philosophers.pml:71 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC phil */
	case 23: // STATE 1 - Philosophers.pml:11 - [printf('Phil %d is thinking, %d \\n',i,((i+1)%4))] (0:17:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("Phil %d is thinking, %d \n", ((P0 *)this)->i, ((((P0 *)this)->i+1)%4));
		/* merge: disposable = 0(17, 2, 17) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->disposable);
		((P0 *)this)->disposable = 0;
#ifdef VAR_RANGES
		logval("phil:disposable", ((int)((P0 *)this)->disposable));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 24: // STATE 3 - Philosophers.pml:15 - [((i>((i+1)%4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((P0 *)this)->i>((((P0 *)this)->i+1)%4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 4 - Philosophers.pml:17 - [forks[i]?disposable] (9:0:3 - 1)
		reached[0][4] = 1;
		if (q_len(now.forks[ Index(((P0 *)this)->i, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->disposable);
		;
		((P0 *)this)->disposable = qrecv(now.forks[ Index(((P0 *)this)->i, 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:disposable", ((int)((P0 *)this)->disposable));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((P0 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: disposable */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->disposable;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->disposable = 0;
		/* merge: forklocations[i] = (forklocations[i]-1)(0, 5, 9) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[2] = now.forklocations[ Index(((P0 *)this)->i, 4) ];
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = (now.forklocations[ Index(((P0 *)this)->i, 4) ]-1);
#ifdef VAR_RANGES
		logval("forklocations[phil:i]", now.forklocations[ Index(((P0 *)this)->i, 4) ]);
#endif
		;
		_m = 4; goto P999; /* 1 */
	case 26: // STATE 7 - Philosophers.pml:21 - [forks[((i+1)%4)]?disposable] (20:0:2 - 1)
		reached[0][7] = 1;
		if (q_len(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->disposable);
		;
		((P0 *)this)->disposable = qrecv(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:disposable", ((int)((P0 *)this)->disposable));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: forklocations[((i+1)%4)] = (forklocations[((i+1)%4)]-1)(20, 8, 20) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[1] = now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ];
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = (now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]-1);
#ifdef VAR_RANGES
		logval("forklocations[((phil:i+1)%4)]", now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]);
#endif
		;
		/* merge: .(goto)(20, 18, 20) */
		reached[0][18] = 1;
		;
		/* merge: printf('Phil %d is eating\\n',i)(20, 19, 20) */
		reached[0][19] = 1;
		Printf("Phil %d is eating\n", ((P0 *)this)->i);
		_m = 4; goto P999; /* 3 */
	case 27: // STATE 11 - Philosophers.pml:26 - [forks[((i+1)%4)]?disposable] (16:0:3 - 1)
		reached[0][11] = 1;
		if (q_len(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->disposable);
		;
		((P0 *)this)->disposable = qrecv(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:disposable", ((int)((P0 *)this)->disposable));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: disposable */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->disposable;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->disposable = 0;
		/* merge: forklocations[((i+1)%4)] = (forklocations[((i+1)%4)]-1)(0, 12, 16) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[2] = now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ];
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = (now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]-1);
#ifdef VAR_RANGES
		logval("forklocations[((phil:i+1)%4)]", now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]);
#endif
		;
		_m = 4; goto P999; /* 1 */
	case 28: // STATE 14 - Philosophers.pml:30 - [forks[i]?disposable] (20:0:2 - 1)
		reached[0][14] = 1;
		if (q_len(now.forks[ Index(((P0 *)this)->i, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->disposable);
		;
		((P0 *)this)->disposable = qrecv(now.forks[ Index(((P0 *)this)->i, 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("phil:disposable", ((int)((P0 *)this)->disposable));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((P0 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: forklocations[i] = (forklocations[i]-1)(20, 15, 20) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = now.forklocations[ Index(((P0 *)this)->i, 4) ];
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = (now.forklocations[ Index(((P0 *)this)->i, 4) ]-1);
#ifdef VAR_RANGES
		logval("forklocations[phil:i]", now.forklocations[ Index(((P0 *)this)->i, 4) ]);
#endif
		;
		/* merge: .(goto)(20, 18, 20) */
		reached[0][18] = 1;
		;
		/* merge: printf('Phil %d is eating\\n',i)(20, 19, 20) */
		reached[0][19] = 1;
		Printf("Phil %d is eating\n", ((P0 *)this)->i);
		_m = 4; goto P999; /* 3 */
	case 29: // STATE 19 - Philosophers.pml:35 - [printf('Phil %d is eating\\n',i)] (0:20:0 - 3)
		IfNotBlocked
		reached[0][19] = 1;
		Printf("Phil %d is eating\n", ((P0 *)this)->i);
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 20 - Philosophers.pml:36 - [hasEaten[i] = (hasEaten[i]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = now.hasEaten[ Index(((P0 *)this)->i, 4) ];
		now.hasEaten[ Index(((P0 *)this)->i, 4) ] = (now.hasEaten[ Index(((P0 *)this)->i, 4) ]+1);
#ifdef VAR_RANGES
		logval("hasEaten[phil:i]", now.hasEaten[ Index(((P0 *)this)->i, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 21 - Philosophers.pml:40 - [forks[i]!disposable] (26:0:1 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		if (q_full(now.forks[ Index(((P0 *)this)->i, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((P0 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((P0 *)this)->i, 4) ], 0, ((int)((P0 *)this)->disposable), 1);
		/* merge: forklocations[i] = (forklocations[i]+1)(0, 22, 26) */
		reached[0][22] = 1;
		(trpt+1)->bup.oval = now.forklocations[ Index(((P0 *)this)->i, 4) ];
		now.forklocations[ Index(((P0 *)this)->i, 4) ] = (now.forklocations[ Index(((P0 *)this)->i, 4) ]+1);
#ifdef VAR_RANGES
		logval("forklocations[phil:i]", now.forklocations[ Index(((P0 *)this)->i, 4) ]);
#endif
		;
		_m = 2; goto P999; /* 1 */
	case 32: // STATE 24 - Philosophers.pml:44 - [forks[((i+1)%4)]!disposable] (27:0:1 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		if (q_full(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ]);
		sprintf(simtmp, "%d", ((int)((P0 *)this)->disposable)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((((P0 *)this)->i+1)%4), 4) ], 0, ((int)((P0 *)this)->disposable), 1);
		/* merge: forklocations[((i+1)%4)] = (forklocations[((i+1)%4)]+1)(0, 25, 27) */
		reached[0][25] = 1;
		(trpt+1)->bup.oval = now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ];
		now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ] = (now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]+1);
#ifdef VAR_RANGES
		logval("forklocations[((phil:i+1)%4)]", now.forklocations[ Index(((((P0 *)this)->i+1)%4), 4) ]);
#endif
		;
		/* merge: .(goto)(0, 28, 27) */
		reached[0][28] = 1;
		;
		_m = 2; goto P999; /* 2 */
	case 33: // STATE 30 - Philosophers.pml:49 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

