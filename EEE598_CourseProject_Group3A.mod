# EEE 598 Spring 2024
# Course Project

#Carolus, Farag, Kassandra


reset; # reset, clear data
#
set BUS;    # set of buses
set BRANCH; # set of branches
#
# PARAMETERS:
	#Annualized investment cost of candidate line
	#Annualized capital cost and size of each DER unit, respectively
	#Probabilities of normal and damage scenarios s and s′, respectively
	#Duration of representative day t in normal operating condition and duration of emergency day t′ for scenario s′, respectively
	#Operation cost of generator g
	#Operation and maintenance cost of each DER unit
	#Maximum number of DER units which can be installed at location d
	#Load shedding penalty factor at bus b
	#Wind curtailment penalty factor of wind farm
	#Load shedding cost at bus b in emergency operating condition
	#Maximum penetration level of DER units and the peak load, respectively
	#Forecasted production of wind farm w, day t, time interval h, and scenario s
	#Amount of load at bus b, day t, time interval h, and scenario s
	#Maximum capacity of line l
	#Susceptance of transmission line l
	#Sufficiently large positive number
	#Maximum generation capacity limit of generator g
	#Forecasted production of wind farm w, emergency day t′, time interval h, and scenario s
	#Amount of load at bus b, emergency day t′, time interval h, and scenario s
	#Binary parameter that is 0 if line l during time interval h, day t′, and damage scenario s′ is in damage state or connected to a damaged substation; 1 otherwise.
	#Binary parameter that is 0 if generator g during time interval h, day t′, and damage scenario s′ is connected to a damaged substation; 1 otherwise.
	#Binary parameter that is 0 if wind farm w during time interval h, day t′, and damage scenario s′ is in damage state or connected to a damaged substation; 1 otherwise. 



# Additional Parameters that are not loaded through sets:
param Bus_Pd{d in LOAD, n in BUS};  # Creates the hourly load per bus - two indices: t and n, for load and bus
param MBase; let MBase:=100; # the MVA Base - a single value, does not represent a vector.

#### VARIABLES:

var 	#Binary and integer variables associated with candidate line l and candidate DER unit at location d, respectively
var 	#Power generation of generator g, time interval h, day t, and scenario s 
var 	#Load shedding at bus b, time interval h, day t, and scenario s
var 	#Power flow of line l, time interval h, day t, and scenario s
var 	#Voltage angle of bus b, time interval h, day t, and scenario s
var 	#Curtailed wind power of wind farm w, time interval h, day t, and scenario s
var 	#Power generation of generator g, time interval h, emergency day t′, damage scenario s′, and scenario s
var 	#Load shedding at bus b, time interval h, emergency day t′, damage scenario s′, and scenario s
var 	#Power flow of line l, time interval h, emergency day t′, damage scenario s′, and scenario s
var 	#Voltage angle of bus b, time interval h, emergency day t′, damage scenario s′, and scenario s
var 	#Curtailed wind power of wind farm w, time interval h, emergency day t′, damage scenario s′, and scenario s

#### EQUATIONS
#EQN 1
minimize COST: sum{l in LOAD, d in DER, g in GEN}((c[l]*x[l])+(c[d,g]*P[d,g]*x[d])+ E[Q[x,?]]

#EQN2

#EQN 3

#EQN 4

#EQN 5

#EQN 6

#EQN 7

#EQN 8

#EQN 9

#EQN 10

#EQN 11

#EQN 12

#EQN 13

#EQN 14

#EQN 15

#EQN 16

#EQN 17

#EQN 18

#EQN 19

#EQN 20

#EQN 21

#@@@@@@@@@@@@@@@
#### Load data:
data;

param: BUS: bus_type bus_name bus_volt0 bus_angle0 bus_p_gen bus_q_gen
            bus_q_min bus_q_max bus_p_l bus_q_l bus_g_shunt bus_b_shunt
            bus_p_gen_max:= 
include  IEEE118.bus;

param: BRANCH: branch_type branch_r branch_x branch_c
               branch_tap0 branch_tap_min branch_tap_max 
               branch_def branch_def_min branch_def_max
               branch_tcsc branch_xtcsc0 branch_Sth :=
include  IEEE118_th_lim.branch;

### A Mathematical Programming Approach for Allocation and Analysis of TCSC in Power Transmission Systems
# IEEE Latin America Transactions 2022 
# J. S. Pereira, E. A. Belati, C. F. Nascimento, P. F. Silva and P. Rossoni
