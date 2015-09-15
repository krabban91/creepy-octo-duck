

int is_printing = 0;
int prints = 0;

active [2] proctype Computer() {
	do 
		:: atomic {
				(is_printing < 1);
				is_printing++;
			}

			printf("%d is printing\n", _pid);
			prints++;
			is_printing--;
	od;
}


active proctype Checker() {
	do 
		:: assert(is_printing >= 0 && is_printing < 2);
	od;
}