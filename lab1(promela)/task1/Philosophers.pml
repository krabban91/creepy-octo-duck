
#define NUM_PHIL 4
#define HAPPY 100

chan forks[NUM_PHIL] = [1] of {byte};
int forklocations[NUM_PHIL];
int hasEaten[NUM_PHIL];

#define p (forklocations[0]<=1 && forklocations[0]>=0) && (forklocations[1]<=1 && forklocations[1]>=0) && (forklocations[2]<=1 && forklocations[2]>=0) && (forklocations[3]<=1 && forklocations[3]>=0)
#define q (hasEaten[0] > 0 && hasEaten[1] > 0 && hasEaten[2] > 0 && hasEaten[3] > 0)

ltl no_double_eat { always p }
ltl no_starving { always eventually q }

proctype phil(int i){
	do
		::printf("Phil %d is thinking, %d \n", i, ((i+1)%NUM_PHIL) );
		byte disposable;
		if /* The last philosopher checks 
			  right instead of left first */
			:: i>((i+1)%NUM_PHIL) ->
				atomic{ /* Only for show.*/
					forks[i]?disposable;
					forklocations[i]--;
				}
				atomic{ /* Only for show.*/
					forks[(i+1)%NUM_PHIL]?disposable;
					forklocations[(i+1)%NUM_PHIL]--;
				}
			:: else ->
				atomic{ /* Only for show.*/
					forks[(i+1)%NUM_PHIL]?disposable;
					forklocations[(i+1)%NUM_PHIL]--;
				}
				atomic{ /* Only for show.*/
					forks[i]?disposable;
					forklocations[i]--;
				}
		fi		
		/* Critical Section*/
		printf("Phil %d is eating\n", i);
		hasEaten[i]++;
		/* end of Critical Section*/

		atomic{ /* Only for show.*/
			forks[i]!disposable;
			forklocations[i]++;
		}
		atomic{ /* Only for show.*/
			forks[(i+1)%NUM_PHIL]!disposable;
			forklocations[(i+1)%NUM_PHIL]++;
		}

	od
}

init {
	int i = 0;
	do 
		:: (i >= NUM_PHIL) -> break
		:: else -> forklocations[i] = 1; forks[i]!i; hasEaten[i]=0; i++
	od

	i = 0;
	do
		:: (i >= NUM_PHIL) -> break
		:: else -> run phil(i); i++
	od
}

/* Found deadlock (Program jammed)*/
/* Fixed with the arbitrary fix (if statement*/
/* Found starvation (Someone didn't eat)*/
/*  */