%%
clear
seed = 1;
rng(seed);

filename_dt1 = 'delayt_1.txt';
filename_dt = 'delayt.txt';

fid_dt1 = fopen(filename_dt1,'wt');
fid_dt = fopen(filename_dt,'wt');

formatSpec_dt1 = '%f\n';
formatSpec_dt = '%f\n';

sim = Simulator();
sim.event_list = EventList();


g = GenePoisEv();
q1 = Queue1();
s1 = ServExpEv1();
q2 = Queue2();
s2 = ServExpEv2();

g.q1 = q1;
q1.s1 = s1;
s1.q1 = q1;
s1.q2 = q2;
q2.s2 = s2;
s2.q2 = q2;

s1.fid = fid_dt1;
s1.format_spec = formatSpec_dt1;

s2.fid = fid_dt;
s2.format_spec = formatSpec_dt;
        
g.sim_limit = 3000;
g.time = 0;
sim.insertEv(g);
sim.doAllEvents();

fclose(fid_dt1);
fclose(fid_dt);

%% data analyzing

fid_dt1 = fopen(filename_dt1, 'r');
sizeA = [1 Inf];
a = fscanf(fid_dt1, formatSpec_dt1, sizeA);
fclose(fid_dt1);
delay_1 = a';
fid_dt = fopen(filename_dt, 'r');
b = fscanf(fid_dt, formatSpec_dt, sizeA);
fclose(fid_dt);
delay = b';
delay_2 = delay - delay_1;
fopen('delayt_2.txt','wt');
fprintf(fopen('delayt_2.txt','wt'), '%f\n', delay_2);
