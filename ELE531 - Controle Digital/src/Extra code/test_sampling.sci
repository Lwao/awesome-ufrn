t = 0:1/4:1;
x = sin(2*%pi*t);
plot(t,x,'b')
t = 0:1/200:1;
y = sin(2*%pi*t);
plot(t,y,'k')
//plotando
//set(gca(),"auto_clear","off");
//plot2d3(t,[x',y'],[1,2]);
//e=gce();
//hl=captions(e.children,['Continuous';'Discrete']);
//hl=captions(e.children,['Continuous';'Discrete'],'in_upper_right');
//hl.legend_location='in_upper_right'
//hl.fill_mode='on';
//
