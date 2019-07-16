void fibonacci(Monitor *mon, int s) {
	unsigned int i, n, nx, ny, nw, nh;
	Client *c;

	for(n = 0, c = nexttiled(mon->clients); c; c = nexttiled(c->next), n++);
	if(n == 0)
		return;
	if(n == 1){
		c = nexttiled(mon->clients);
		resize(c, mon->wx, mon->wy, mon->ww - 2 * c->bw, mon->wh - 2 * c->bw, 0);
		return;
	}
	
	nx = mon->wx;
	ny = mon->gappx;
	nw = mon->ww;
	nh = mon->wh;
	
	for(i = 0, c = nexttiled(mon->clients); c; c = nexttiled(c->next)) {
		if((i % 2 && nh / 2 > 2 * c->bw)
		   || (!(i % 2) && nw / 2 > 2 * c->bw)) {
			if(i < n - 1) {
				if(i % 2)
					nh /= 2;
				else
					nw /= 2;
				if((i % 4) == 2 && !s)
					nx += nw;
				else if((i % 4) == 3 && !s)
					ny += nh;
			}
			if((i % 4) == 0) {
				if(s)
					ny += nh;
				else
					ny -= nh;
			}
			else if((i % 4) == 1)
				nx += nw;
			else if((i % 4) == 2)
				ny += nh;
			else if((i % 4) == 3) {
				if(s)
					nx += nw;
				else
					nx -= nw;
			}
			if(i == 0)
			{
				if(n != 1)
					nw = mon->ww * mon->mfact;
				ny = mon->wy + mon->gappx;
			}
			else if(i == 1)
				nw = mon->ww - nw - mon->gappx;
			i++;
		}
		if((s == 0 && i <= 4 && (i!=2 || n==2)) || (s==1 && (i%2==1 || i==n)))
			resize(c, nx + mon->gappx, ny, nw - 2 * (c->bw) - mon->gappx, nh - 2 * (c->bw) - 2*mon->gappx, False);
		else
			resize(c, nx + mon->gappx, ny, nw - 2 * (c->bw) - mon->gappx, nh - 2 * (c->bw) - mon->gappx, False);
	}
}

void
dwindle(Monitor *mon) {
	fibonacci(mon, 1);
}

void
spiral(Monitor *mon) {
	fibonacci(mon, 0);
}
