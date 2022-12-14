**IIITB_RINGCOUNTER**

**INTRODUCTION**

This project simulates the design of a 4-bit ring counter using verilog HDL. A ring counter works in a similar way as a shift register. The only difference is that the output of the last flip-flop is connected to the input of the first flip-flop. In this way, the counter forms a ring and hence is called ring counter. In this design, four D-Flip-flops are used with clock and ori(override input) signals.

**BLOCK DIAGRAM**

<p align="center">
  <img  src="pictures/image1.png">
 </p>


The above figure is the block diagram of a 4-bit ring counter. The figure shows four D flip flop connected with a clock and an ORI signal. The design uses an active high ORI signal which sets the first flip flop to '1' and the other three flip flops to '0' when ORI is high. The circuit uses a positive edge triggered clock.

**WORKING**

The counter is set to an initial state of *'1000'* by the ORI signal. In the next positive edge of the clock, the values of the flip flops are shifted right and the output of last flip flop is sent to the first one. So, the next state becomes *'0100'*. Similarly after next positive edge of clock, the state of the counter becomes *'0010'*. This continues until the ORI is again high which will set the counter back to *'1000'*.

**RTL SIMULATION**


<p align="center">
  <img  src="pictures/simulation.jpeg">
 </p>


In the above waveform, ORI signal sets the counter to '1000' and then the counter runs in a loop with three states until ORI is high again.

**TOOLS USED**

**IVERILOG**

Icarus Verilog is a Verilog simulation and synthesis tool.
To install iverilog, type the following command in the terminal:

$ sudo apt install iverilog 

**GTKWAVE**
GTKWave is a VCD waveform viewer based on the GTK library. This viewer support VCD and LXT formats for signal dumps.

$ sudo apt install gtkwave 




**YOSYS**
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.

Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.

Synthesis takes place in multiple steps:

-Converting RTL into simple logic gates.
-Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
-Optimizing the mapped netlist keeping the constraints set by the designer intact.

Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the yosys C++ code base.

Yosys is free software licensed under the ISC license (a GPL compatible license that is similar in terms to the MIT license or the 2-clause BSD license).
To install Yosys in Ubuntu, follow the following steps:

$ sudo apt-get install build-essential clang bison flex \ libreadline-dev gawk tcl-dev libffi-dev git \ graphviz xdot pkg-config python3 libboost-system-dev \ libboost-python-dev libboost-filesystem-dev zlib1g-dev

To configure the build system to use a specific compiler, use one of the following command:

$ make config-clang

$ make config-gcc

To build Yosys simply type 'make' in this directory.

$ make

$ sudo make install

$ make test

<p align="center">
  <img  src="pictures/Screenshot from 2022-08-18 14-53-46 (1).png">
 </p>
 
 
 
<p align="center">
  <img  src="pictures/Screenshot from 2022-08-18 14-54-50 (1).png">
 </p>




**GTL- Gate Level Simulation**

GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.
Below picture gives an insight of the procedure. Here while using iverilog, you also include gate level verilog models to generate GLS simulation.


<p align="center">
  <img src="pictures/Screenshot from 2022-08-18 14-51-34 (1).png">
</p>



<p align="center">
  <img  src="pictures/image2.png">
 </p>


**Docker Installation**

$ sudo apt-get remove docker docker-engine docker.io containerd runc (removes older version of docker if installed)

$ sudo apt-get update

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
$ sudo mkdir -p /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

$ apt-cache madison docker-ce (copy the version string you want to install)

$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin (paste the version string copies in place of <VERSION_STRING>)

$ sudo docker run hello-world (If the docker is successfully installed u will get a success message here)



**Openlane Installation**

$ git clone https://github.com/The-OpenROAD-Project/OpenLane.git

$ cd OpenLane/

$ make

$ make test


**Magic Installation**

For Magic to be installed and work properly the following softwares have to be installed first:


**Installing csh**
$ sudo apt-get install csh

**Installing x11/xorg**
$ sudo apt-get install x11

$ sudo apt-get install xorg

$ sudo apt-get install xorg openbox


**Installing GCC**
$ sudo apt-get install gcc


**Installing build-essential**
$ sudo apt-get install build-essential

**Installing OpenGL**
$ sudo apt-get install freeglut3-dev


**Installing tcl/tk**
$ sudo apt-get install tcl-dev tk-dev

**Installing magic**
After all the softwares are installed, run the following commands for installing magic:

$ git clone https://github.com/RTimothyEdwards/magic

$ cd magic

$ ./configure

$ make

$ make install


**Klayout Installation**
$ sudo apt-get install klayout


**ngspice Installation**
$ sudo apt-get install ngspice


**PRE SYNTHESIS**

-To clone the repository, download the netlist files and simulate the results, Enter the following commands in your terminal:

 $ git clone https://github.com/DantuNandiniDevi/iiitb_freqdiv 

 $ cd iiitb_freqdiv 
 
 $ iverilog -o iiitb_freqdiv_out.out iiitb_freqdiv.v iiitb_freqdiv_tb.v
 
 $ ./iiitb_freqdiv_out.out
 
 $ gtkwave iiitb_freqdiv_vcd.vcd


**POST SYNTHESIS**

$ yosys

yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> read_verilog iiitb_freqdiv.v

yosys> synth -top iiitb_freqdiv

yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> stat

yosys> show

yosys> write_verilog iiitb_freqdiv_netlist.v

$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v iiitb_freqdiv_netlist.v iiitb_freqdiv_tb.v

$ ./a.out

$ gtkwave iiitb_freqdiv_vcd.vcd


** CREATING CUSTOM INVERTER CELL**
$ git clone https://github.com/nickson-jose/vsdstdcelldesign.git

$ cd vsdstdcelldesign

$  cp ./libs/sky130A.tech sky130A.tech

$ magic -T sky130A.tech sky130_inv.mag &


<p align="center">
  <img  src="pictures/magic cell.png">
 </p>


The above layout will open. The design can be verified and various layers can be seen and examined by selecting the area of examination and type what in the tcl window.

To extract Spice netlist, Type the following commands in tcl window.

% extract all

% ext2spice cthresh 0 rthresh 0

% ext2spice

(cthresh 0 rthresh 0 is used to extract parasitic capacitances from the cell.)



<p align="center">
  <img  src="pictures/spice.png">
 </p>

Open the terminal in the directory where ngspice is stored and type the following command, ngspice console will open:

$ ngspice sky130_inv.spice 



<p align="center">
  <img  src="pictures/ngspice.png">
 </p>
 
 
 Now you can plot the graphs for the designed inverter model.

-> plot y vs time a

<p align="center">
  <img  src="pictures/plot.png">
 </p>
 
 Four timing parameters are used to characterize the inverter standard cell:

Rise time: Time taken for the output to rise from 20% of max value to 80% of max value
Rise time = (2.23843 - 2.17935) = 59.08ps
Fall time- Time taken for the output to fall from 80% of max value to 20% of max value
Fall time = (4.09291 - 4.05004) = 42.87ps
Cell rise delay = time(50% output rise) - time(50% input fall)
Cell rise delay = (2.20636 - 2.15) = 56.36ps
Cell fall delay = time(50% output fall) - time(50% input rise)
Cell fall delay = (4.07479 - 4.05) = 24.79ps

 **Layout**
 
 The layout is generated using OpenLane. To run a custom design on openlane, Navigate to the openlane folder and run the following commands:

$ cd designs

$ mkdir iiitb_ringcounter

$ cd iiitb_ringcounter

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_ringcounter.v


The iiitb_ringcounter.v file should contain the verilog RTL code you have used and got the post synthesis simulation for.

Copy sky130_fd_sc_hd__fast.lib, sky130_fd_sc_hd__slow.lib, sky130_fd_sc_hd__typical.lib and sky130_vsdinv.lef files to src folder in your design.



**Results**

<p align="center">
  <img  src="pictures/placement_k.png">
 </p>

<p align="center">
  <img  src="pictures/routing_k.png">
 </p>
 
 
 
 **REPORTS**


<p align="center">
  <img  src="pictures/WhatsApp Image 2022-09-15 at 11.35.19.jpeg">
 </p>
 
 
 <p align="center">
  <img  src="pictures/WhatsApp Image 2022-09-15 at 11.35.43.jpeg">
 </p>
 
 
 <p align="center">
  <img  src="pictures/WhatsApp Image 2022-09-15 at 11.36.00.jpeg">
 </p>
 
 <p align="center">
  <img  src="pictures/WhatsApp Image 2022-09-15 at 11.37.12.jpeg">
 </p>
 

**NOTE- There was no usage of inverter cell in the design**

**ACKNOWLEDGMENTS**

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

**CONTRIBUTORS**

- Sirigiri Sai Keerthan, IMtech IIIT Bangalore.
- Kunal Ghosh Director, VSD Corp.Pvt.Ltd.
- Dantu Nandini Devi,Mtech IIIT bangalore.

**CONTACT**

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com 
- Sirigiri Sai Keerthan, iMtech IIIT Bangalore. <SaiKeerthan.Sirigiri@iiitb.ac.in> 


**REFERENCES**

[1] <https://en.wikipedia.org/wiki/Ring_counter>

[2] <https://www.geeksforgeeks.org/ring-counter-in-digital-logic/>

[3] <https://www.javatpoint.com/verilog-ring-counter> 

[4] <https://www.allaboutcircuits.com/textbook/digital/chpt-12/ring-counters/>

[5] <https://github.com/ArshKedia/iiitb_3bit_rc/blob/main/README.md>

[6] <https://github.com/DantuNandiniDevi/iiitb_freqdiv>




**MIDTERM EXAMINATION**

**POST SYNTHESIS GATE COUNT-12** 

<p align="center">
  <img  src="pictures/printing statistics.jpeg">
 </p>
 
 
 **AREA-1347.041**
 
 <p align="center">
  <img  src="pictures/area.jpeg">
 </p>
 
 
 **FLIP-FLOP TO STANDARD CELL RATIO-1/3**
 
 <p align="center">
  <img  src="pictures/printing statistics.jpeg">
 </p>
 
 **POWER-8.11x10^-5 Watts**
<p align="center">
  <img  src="pictures/power.jpeg">
 </p>


**PERFOMANCE**
<p align="center">
  <img  src="pictures/keerthan.png">
 </p>

This is the performance from reg to reg i.e from flipflop 16 to flipflop 17.
Performance = 1/(clock period - slack) 
           = 1/(10.00 - 9.04)ns 
           = 1.04 Ghz 


